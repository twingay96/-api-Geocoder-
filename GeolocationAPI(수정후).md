참조 : [https://developer.mozilla.org/en-US/docs/Web/API/Geolocation_API/Using_the_Geolocation_API](https://developer.mozilla.org/en-US/docs/Web/API/Geolocation/getCurrentPosition)https://developer.mozilla.org/en-US/docs/Web/API/Geolocation/getCurrentPosition

    rails g stimulus geolocation
명령어 실행 후 생성된 js파일에 다음 과 같이 작성:
![image](https://github.com/twingay96/-api-Geocoder-/assets/64403357/b13df52b-6afb-4368-8d58-c841a98c7dd3)

옵션 설정: options 객체는 Geolocation API의 getCurrentPosition 함수에 전달되는 설정값을 정의합니다.

        enableHighAccuracy: true로 설정되어 있어, 가능한 가장 정확한 위치를 반환하도록 요청합니다.
        timeout: 위치 정보를 가져오는 데 최대 5000 밀리초(5초)를 기다립니다.
        maximumAge: 캐시된 위치 정보를 사용하지 않음을 의미합니다. 값이 0이므로 항상 최신의 위치 정보를 요청합니다.
        
search 메서드는 navigator.geolocation.getCurrentPosition 함수를 호출하여 사용자의 현재 위치를 가져옵니다. 
성공 콜백으로 this.success를, 오류 콜백으로 this.error를, 그리고 위에서 정의한 options를 인자로 전달합니다.

성공 콜백: success 메서드는 위치 검색이 성공했을 때 호출됩니다. 위치 데이터는 pos 매개변수를 통해 전달되며, 
이 객체에서 위도와 경도 정보를 추출하여 콘솔에 로그를 남기고, 웹 페이지를 새 위치로 리다이렉트합니다.

data-controller="geolocation"을 추가:
![image](https://github.com/twingay96/-api-Geocoder-/assets/64403357/080e280e-6e3f-4c22-bd9c-e4a01afce9fb)

에서 rails s를 하면:
![image](https://github.com/twingay96/-api-Geocoder-/assets/64403357/4a014336-8783-41d0-aabf-d8dd3a298f3f)
![image](https://github.com/twingay96/-api-Geocoder-/assets/64403357/3f8c057e-8c97-4e5e-bfb3-fe15998e2f4b)

현재 나의 위치를 알아낼 수 있음.

![image](https://github.com/twingay96/-api-Geocoder-/assets/64403357/f48bcbfb-054d-4a3b-a429-d63e40876e97)

![image](https://github.com/twingay96/-api-Geocoder-/assets/64403357/bb2ea109-4a69-42df-9d8f-3bc753f6950b)

![image](https://github.com/twingay96/-api-Geocoder-/assets/64403357/114cb671-f3f1-428c-ab92-9181a1c495b9)

검색시 url형태가 다음과 같다.
![image](https://github.com/twingay96/-api-Geocoder-/assets/64403357/86dca43a-5ab0-48ae-88da-0adb9436e4ec)

url을 관찰해보면 params[:place]가 어떻게 요청되는지 확인이 가능함. 이를 통해
현재 나의 위치(coordinates값인 latitude, longtitude가 place로 전달되어야함.)값이 전달되어야함을 알 수 있음.

![image](https://github.com/twingay96/-api-Geocoder-/assets/64403357/f6247998-56ca-4f89-b743-d73959d01eb6)

location.assign() 메서드는 JavaScript의 Window 객체의 location 속성을 사용하여 웹 페이지를 새로운 URL로 이동시키는 데 사용됩니다. 
즉, 이 메서드는 새로운 문서를 로드하고 현재 페이지를 새 URL로 대체해줌. 

        window.location.assign(url);
        
여기서 url은 사용자를 이동시키고자 하는 새로운 페이지의 주소를 나타냅니다. URL은 완전한 URL(도메인자체가 다른 완전히 다른 url)이 될 수도 있고, 동일한 원본내의 (같은 도메인내의)경로일 수도 있습니다.

예를 들어, 사용자가 다른 페이지(별개의 도메인)로 리디렉션되길 원한다면 다음과 같은 코드를 사용할 수 있습니다:

        location.assign('https://www.example.com');
        
또는, 현재 도메인 내의 다른 페이지로 리디렉션하려면 상대 경로를 사용할 수 있습니다:

        location.assign('/another-page.html');

현재 coordinates값이 전달되었고 near메소드를 통해서 현재나의위치로부터 322km이내의 도시들의 위치를 표시해줌:
![image](https://github.com/twingay96/-api-Geocoder-/assets/64403357/da6d98cd-1ba0-45f8-b76d-e34ef47ec1e8)

params[:place]값 확인해보기:
![image](https://github.com/twingay96/-api-Geocoder-/assets/64403357/95efe2c0-8626-48e0-b7c2-0de11e186880)

![image](https://github.com/twingay96/-api-Geocoder-/assets/64403357/c8ebd799-dab2-4510-baa7-6d1d5d1d25d3)

위의 코드와 같이 

near메소드는 

        Model.near(center_point, distance, options)

Model은 지리적 좌표가 있는 모델이며, center_point는 중심점(주소나 [위도, 경도] 배열 형태)이고, 
distance는 중심점으로부터의 거리(킬로미터나 마일 단위)입니다. options는 추가 옵션들을 설정할 수 있는 해시입니다.

이경우엔, 배열이아닌 center_point가 전달되었어도 잘 동작하는 중.

코드의 흐름을 요약하자면:

        1.사용자가 웹 애플리케이션의 "Search near me" 버튼을 클릭합니다.
        2.이 동작은 Stimulus 컨트롤러의 search 함수를 트리거합니다.
        3.search 함수는 브라우저의 Geolocation API를 사용하여 사용자의 현재 위치를 얻습니다.
        4.현재 위치를 성공적으로 얻으면, success 콜백 함수가 실행됩니다.
        5.success 함수 내에서 location.assign() 메서드를 호출하여 현재 페이지의 URL을 새로운 URL로 변경합니다. 
          이 새로운 URL은 사용자의 위도와 경도를 쿼리 매개변수로 포함합니다.
        6.이렇게 변경된 URL은 동일한 도메인(여기서는 127.0.0.1:3000) 내의 다른 페이지(/locations?                       
          place=${crd.latitude},${crd.longitude})로 이동합니다. 이는 사용자의 현재 위치에 따라 지도 상의 내용을 업데이트하기 위한 것입니다.






