참조 : https://github.com/alexreisner/geocoder?tab=readme-ov-file#geospatial-calculations

Geocoder는 지리적 코딩(geocoding) 및 반대 지리적 코딩(reverse geocoding) 기능을 제공합니다. 
이 라이브러리를 사용하면 주소나 위도와 경도를 바탕으로 서로의 정보를 찾을 수 있습니다. 예를 들어, 주소를 입력하면 해당 위치의 위도와 경도를 찾을 수 있고, 
반대로 위도와 경도를 입력하면 그에 해당하는 주소를 찾을 수 있습니다.

주요 기능은 다음과 같습니다:

    1.지리적 코딩(Geocoding): 주소나 지명을 입력하면 해당 위치의 위도와 경도를 반환합니다.
    2.반대 지리적 코딩(Reverse Geocoding): 위도와 경도를 입력하면 해당하는 주소나 지명을 반환합니다.
    3.근처 위치 찾기: 특정 위치의 위도와 경도를 기준으로 주변의 위치나 주소를 찾는 기능도 제공합니다.
    4.거리 및 방향 계산: 두 지점 간의 거리나 방향을 계산할 수 있습니다.
    5.다양한 지도 API 지원: Google, Bing, OpenStreetMap 등 여러 지도 서비스의 API를 지원하여 유연하게 사용할 수 있습니다.

프로젝트 생성후 gemfile에 직접 추가(bundle add geocoder 로 할시 rails c가 제대로 실행 안되는 오류가 발생함.)

참고 : https://stackoverflow.com/questions/43813749/error-undefinded-method-load-defaults-when-trying-to-deploy-app-on-heroku

    gem 'geocoder', '~> 1.8', '>= 1.8.2' 
후에 
    bundle install
그리고 rails c 를 실행하여 geocoder라이브러리를 콘솔에서 조작해보기:
![image](https://github.com/twingay96/-api-Geocoder-/assets/64403357/10e25f99-a3de-4f99-b325-83a4ef3f543c)
![image](https://github.com/twingay96/-api-Geocoder-/assets/64403357/75efcda2-52df-43f8-be59-3e9c2495f23d)

"Geocoder::Result 객체의 배열"은 일반적으로 다음과 같은 정보를 포함할 수 있습니다:

    @cache_hit: 이 속성은 결과가 캐시에서 검색되었는지 여부를 나타냅니다. 
     nil이면 캐시를 통해 검색되지 않았다는 의미이고, 그렇지 않다면 이전에 같은 요청을 했을 때의 결과가 캐시에 저장되어 있음을 의미합니다.
    
    @data: 이 변수는 검색 결과에 대한 상세 정보를 포함하는 해시입니다. 이 해시는 다양한 키-값 쌍을 포함할 수 있는데, 이는 사용하는 지오코딩 서비스(API)에 따라 달라질 수 있습니다. 
    
예를 들어, OpenStreetMap 데이터를 사용하는 경우, 다음과 같은 정보가 포함될 수 있습니다:
    
    place_id: Nominatim 서비스에서 사용하는 내부적인 고유 식별자입니다.
    licence: 데이터의 라이선스를 나타냅니다. 여기서는 OpenStreetMap의 기여자들로부터 얻은 데이터임을 명시하고 있습니다.
    osm_type 및 osm_id: OpenStreetMap의 데이터 유형과 그에 대한 고유 식별자입니다. relation은 여러 OSM 요소들이 관계를 가질 때 사용됩니다.
    lat 및 lon: 검색된 위치의 위도와 경도를 나타냅니다.
    class 및 type: 검색된 객체의 범주와 유형을 설명합니다. 여기서는 행정 구역(administrative)에 해당하는 것으로 보입니다.
    importance: 검색 결과의 상대적 중요도를 나타내는 점수입니다.
    display_name: 사용자가 읽을 수 있는 형식의 위치 이름입니다.
    address: 검색된 위치에 대한 상세 주소 정보를 포함하는 해시입니다.
    boundingbox: 해당 위치를 포함하는 사각형의 경계 좌표를 나타냅니다.


![image](https://github.com/twingay96/-api-Geocoder-/assets/64403357/0eef89f6-a7c0-470e-8a1d-3e191246100c)


특히 객체들의 배열의 첫번째 객체인 "Geocoder::Result" 객체 내부에는 이러한 정보에 접근하기 위한 여러 메소드가 있습니다. 
예를 들어, 첫번째 객체에 .latitude와 .longitude (또는 .lat와 .lon) 메소드를 사용하여 위도와 경도를 직접 가져올 수 있고, .address를 사용하여 전체 주소를 가져올 수 있습니다.

여기서 result.first를 하면 처번째 객체를 반환하고, result.first.cordinates를 실행해보면 해당객체의 
위도(lat, latitude)와 두 번째 값은 경도(lon, longitude)의 배열을 반환하는 것을 확인가능:
![image](https://github.com/twingay96/-api-Geocoder-/assets/64403357/647f1bb1-a117-4959-9edb-7d052c89a934)

해당 배열값을 google에 검색해보면 지도에 해당위치(Paris의 정중앙)를 표시해주는 것을 확인가능:
![image](https://github.com/twingay96/-api-Geocoder-/assets/64403357/de5a6309-c22f-4b41-b226-6629185c4ad0)

Geocoder.search('korea, Seoul')을 호출하면, 주어진 문자열 'korea, Seoul'에 대한 위치 정보를 검색합니다. 
이때, 'korea'가 국가를 의미하고, 'Seoul'이 그 국가 내의 특정 지역(도시)을 의미합니다:
![image](https://github.com/twingay96/-api-Geocoder-/assets/64403357/5c7046b6-528b-4510-af0f-a15f91124fb2)

특정 두 지역사이의 거리 및 중앙의위치 를 알고 싶을때 Geocoder::Calculations사용:
![image](https://github.com/twingay96/-api-Geocoder-/assets/64403357/f30a585f-cf71-482c-a43f-154e0cd2c624)

이를 실제 모델로 구현해보기:

    rails g scaffold Location name address latitude:float:index longitude:float:index

latitude:float:index와 longitude:float:index: 이 필드들은 데이터베이스에 소수점 좌표를 저장하는 데 적합한 float 타입으로 추가됩니다. 
:index를 추가함으로써 이 필드들에 데이터베이스 인덱스를 추가하는데, 이는 해당 좌표를 기준으로 데이터베이스를 조회할 때 성능상의 이점을 제공합니다.
생성된 마이그레이션파일 확인:

![image](https://github.com/twingay96/-api-Geocoder-/assets/64403357/67b021b5-b9a4-4160-b169-254aee5cc1af)

    rails db:migrate 

실행하여 db에 반영후 생성된 스키마파일 확인:
![image](https://github.com/twingay96/-api-Geocoder-/assets/64403357/b7b4dd43-93d7-4c90-a8d6-479bf22b60ce)

그리고 seeds.rb파일에 입력할 테스트용 데이터를 rails c실행하여 콘솔에서 조회: 
![image](https://github.com/twingay96/-api-Geocoder-/assets/64403357/610703ca-8314-44f5-b52c-960e445c7b82)
![image](https://github.com/twingay96/-api-Geocoder-/assets/64403357/04c6670d-703c-4eef-993c-2116ab81fe7f)

seeds.rb에 입력(name과 address만 직접입력 후 geocoder로 latitude,longitude 입력예정):
![image](https://github.com/twingay96/-api-Geocoder-/assets/64403357/5b395e9e-85be-47a9-905c-298a648fbc00)

    rails db:seed
후 rails c를 실행하여 db에 제대로 입력되었는지 확인:
![image](https://github.com/twingay96/-api-Geocoder-/assets/64403357/c66f856f-7026-4013-a9d8-36498539e4e3)

![image](https://github.com/twingay96/-api-Geocoder-/assets/64403357/0eb02487-05f7-4f4f-b9c0-d278069681c4)

이상태에서 db에 저장된 데이터들(address)로 latitude와 longitude를 조회 해보기:

    geocoded_by :address

![image](https://github.com/twingay96/-api-Geocoder-/assets/64403357/7f272ffa-2e0f-4c20-86a0-5a83f5706bba)

geocoded_by 메서드는 모델에 지오코딩 기능을 추가하는 Geocoder gem의 클래스 메서드입니다. 이 메서드를 사용하면 주어진 주소의 위도와 경도를 자동으로 찾아 해당 모델의 인스턴스에 저장할 수 있습니다. 

    Location.geocoded: 이 스코프는 위도(latitude)와 경도(longitude) 값이 모두 NULL이 아닌 Location 레코드를 찾습니다. 
    Location.not_geocoded: 반대로 이 스코프는 위도나 경도 중 적어도 하나가 NULL인 Location 레코드를 찾습니다. 
    
![image](https://github.com/twingay96/-api-Geocoder-/assets/64403357/fad02ff0-14ca-45f4-90a7-61dbd2f2bcc2)

현재 지오코딩이되어 있지 않음을 확인 할 수 있음, 지오코딩 해주기:

![image](https://github.com/twingay96/-api-Geocoder-/assets/64403357/aee85c58-d578-44a2-b9e8-001af1bc9bb1)
![image](https://github.com/twingay96/-api-Geocoder-/assets/64403357/616dae10-8c22-43c5-8c10-11ffa0ba8899)
![image](https://github.com/twingay96/-api-Geocoder-/assets/64403357/f7f573a4-7a3b-4be4-875c-644ee1e9868e)
![image](https://github.com/twingay96/-api-Geocoder-/assets/64403357/0b6f5732-8112-41dd-b529-77e2062c0fb6)

같은 과정을 다른 데이터들에도 수행:
![image](https://github.com/twingay96/-api-Geocoder-/assets/64403357/a02b7d47-1c4a-4a87-be62-fd386a157af1)
![image](https://github.com/twingay96/-api-Geocoder-/assets/64403357/0378720a-2948-41eb-bdae-db5a615fb7ed)

이제 모든 데이터들의 입력이 완료되었으니, 라우트 root설정후 rails s 를 실행하여 실제 페이지 확인해보기 :
![image](https://github.com/twingay96/-api-Geocoder-/assets/64403357/9c8af4cb-f4ff-4581-a6da-68b0a5585d45)
![image](https://github.com/twingay96/-api-Geocoder-/assets/64403357/db9c0f8d-01e2-488e-9c5f-099617457915)

이제 검색기능을 구현하기 위해 필요한 메소드 알아보기:

![image](https://github.com/twingay96/-api-Geocoder-/assets/64403357/38c75b5f-9e13-4681-8498-639c775ea133)
![image](https://github.com/twingay96/-api-Geocoder-/assets/64403357/49242536-bd8d-4c7b-825e-6b7d83f621f9)

주로 ModelName.near() 메소드를 사용함(기본값은 마일단위임, 해당거리이내에 도시들을 모두반환), 이 메소드들을 뷰,컨트롤러에 구현:

![image](https://github.com/twingay96/-api-Geocoder-/assets/64403357/d5a35b7c-f494-4861-8390-7a9fc85e1436)

![image](https://github.com/twingay96/-api-Geocoder-/assets/64403357/4006a142-4a97-4c9c-a813-f16462f45bd5)

![image](https://github.com/twingay96/-api-Geocoder-/assets/64403357/648ae299-207d-4c1e-8e69-3b4d651a2335)
![image](https://github.com/twingay96/-api-Geocoder-/assets/64403357/218a2cbe-be10-4f6e-9d1e-c2927220dfaf)

서울로부터 165마일 이내에 있는 도시는 부산, 광주로 부터 165마일 이내에 있는 도시는 부산으로 조회됨.

뷰에 거리를 사용자가 지정할 수 있게끔 수정:

![image](https://github.com/twingay96/-api-Geocoder-/assets/64403357/790dffc0-26e4-4871-a4ac-c502aab8f7e9)
![image](https://github.com/twingay96/-api-Geocoder-/assets/64403357/4104859c-343e-4462-9739-8afa72d1aad5)
![image](https://github.com/twingay96/-api-Geocoder-/assets/64403357/7bf5ceb4-527d-4e3a-98db-06d0f2f17b1f)

Rails에서 HTML 폼이 제출될 때, 폼에 있는 각 입력 필드의 name 속성 값이 URL의 쿼리 스트링으로 전송되며, 이는 params 해시에 자동으로 매핑,
각 입력 필드의 name 속성 값은 params 해시의 키가 되며, 사용자가 입력하거나 선택한 값이 해당 키의 값이 됩니다.
즉 다시말해서,  "<%= form.select :distance, [0,265.54,321.87]%>" 처럼 params를 따로 지정하지 않더라도 name으로 지정된 :distance가 params로전달됨. 
params를 따로설정안하면 name을 기준으로  URL의 쿼리 스트링(query string)으로 전송하여서 자동으로 params를 생성함

![image](https://github.com/twingay96/-api-Geocoder-/assets/64403357/bc42f189-9215-4c70-b619-8e180b814560)

때문에 <%= form.text_field :place, :params[:place] %>에서 굳이 :params[:place]를 넣지 않더라도, name이 :place로 설정되어 있기에, 
컨트롤러에서 params[:place]로 접근이 가능함.



이제 상세보기 페이지에서 현재 도시에서 가까운 도시의 정보 출력하기(ModelName.nearbys 메소드 사용, 자기자신을 제외하고 거리이내에 도시들을 반환):

![image](https://github.com/twingay96/-api-Geocoder-/assets/64403357/25dbb452-dfa0-42da-af74-2f44248676fb)
![image](https://github.com/twingay96/-api-Geocoder-/assets/64403357/a59cf893-d822-48ec-af20-33a1d8461aa3)
![image](https://github.com/twingay96/-api-Geocoder-/assets/64403357/2c58f27e-1831-4b10-8f05-367958b1afae)
![image](https://github.com/twingay96/-api-Geocoder-/assets/64403357/beda5a3a-db94-4f2e-a950-20d7fdfca837)
distance_to 메소드 사용:

![image](https://github.com/twingay96/-api-Geocoder-/assets/64403357/216fe07e-d1ba-4349-baf0-6ed30a1588e6)

![image](https://github.com/twingay96/-api-Geocoder-/assets/64403357/57ecae25-8ca0-45fa-ad13-fa5b7a81d939)
![image](https://github.com/twingay96/-api-Geocoder-/assets/64403357/6ade0889-dbb4-4127-8770-5c7d1da63fc9)

현재 사용단위가 마일인데 킬로미터로 변경하기:

    rails generate geocoder:config
    
명령어 실행후, geocoder.rb파일의 units를 km로 수정:

![image](https://github.com/twingay96/-api-Geocoder-/assets/64403357/593e8222-3efb-4c3a-a2b0-1390f444912b)

후에 뷰와 컨트롤러에 마일단위로 넣은 값들을 다시 km로 수정해준다, 이때 소수점을 넣게되면 이상하게 오작동하는 문제가발생:

![image](https://github.com/twingay96/-api-Geocoder-/assets/64403357/5aa732e3-6c26-4cf2-af25-d1294255dc41)
![image](https://github.com/twingay96/-api-Geocoder-/assets/64403357/212a8541-eb6b-44ac-ba75-2d683ae25ec3)

이제 mapbox를 사용해서 지도이미지 출력기능 구현:

https://account.mapbox.com/

계정생성후 playground로 이동:

![image](https://github.com/twingay96/-api-Geocoder-/assets/64403357/de7c9308-1729-4fda-8261-67551c6890a8)

Longitude: 126.9782914 Latitude: 37.5666791 로 설정하고 오버레이를 배치하면:

![image](https://github.com/twingay96/-api-Geocoder-/assets/64403357/2abc923b-aa8c-4cff-a3bc-c899196cb5d6)

에서 Request URL(get요청)을 통해서 사용가능함:

![image](https://github.com/twingay96/-api-Geocoder-/assets/64403357/1028a660-7212-4240-a2b0-122362ab9f5a)
![image](https://github.com/twingay96/-api-Geocoder-/assets/64403357/3a4de4d3-40bb-4c6e-a31e-f6f2067dfdac)

API(Application Programming Interface)는 일반적으로 클라이언트와 서버 간의 통신을 위해 사용되는 인터페이스, 
웹 API의 경우, 클라이언트는 HTTP 요청을 통해 URL(Uniform Resource Locator)을 사용하여 서버에 데이터를 요청하거나 서버에 데이터를 보냅니다.
API를 사용할 때는 URL을 통해 특정 엔드포인트(endpoint)에 접근하며, 이 엔드포인트는 데이터를 요청하거나 조작하는 데 필요한 로직을 처리합니다. 
클라이언트는 URL을 통해 API와 통신하고, API는 요청에 따라 데이터를 JSON, XML 또는 다른 형식으로 응답합니다.
이때 img태그는 get요청

각 도시마다 알맞은 지도위치를 표시하기:

![image](https://github.com/twingay96/-api-Geocoder-/assets/64403357/6a81d5da-1e2d-40c5-9665-682c937fd5ba)

를 #{}를 사용해서 각도시(각 location 객체)마다 위치정보를 다르게 변경:

![image](https://github.com/twingay96/-api-Geocoder-/assets/64403357/ab2defd4-fb3b-43b9-9081-ec2a98559bde)
![image](https://github.com/twingay96/-api-Geocoder-/assets/64403357/10d42abd-ae2b-46b6-9ea1-3798136cec5f)

이제 새로운 location을 create할때 사용자가 입력한 address를 기반으로 자동으로 Longitude값 ,Latitude값을 컬럼에 넣어주는 기능(지오코딩)을 구현:

![image](https://github.com/twingay96/-api-Geocoder-/assets/64403357/23a6fd9f-d6f6-4d93-aefd-cef1fe94c39b)

after_validation :geocode의 기능은 다음과 같습니다:

        지오코딩 실행: geocoded_by :address로 지정된 필드(여기서는 address)에 기반하여 지오코딩을 수행합니다. 지오코딩은 주소를 위도와 경도의 좌표로 변환하는 과정입니다.
        자동 좌표 할당: 지오코딩이 성공적으로 완료되면, 반환된 위도와 경도의 값이 해당 객체의 latitude와 longitude 속성에 자동으로 할당됩니다.
        데이터 무결성 보장: 유효성 검사 후에 지오코딩을 실행함으로써, 데이터가 데이터베이스에 저장되기 전에 올바른 위치 데이터가 있는지 확인합니다. 
        만약 주소 필드가 비어 있거나 유효하지 않은 경우, 지오코딩은 실행되지 않습니다.

정상동작하는지 확인하기위해서 rails c에서 특정도시의 address 를 조회:
![image](https://github.com/twingay96/-api-Geocoder-/assets/64403357/fe1d5875-0ca2-4d18-835f-e23092b0b32e)

해당 address를 입력하여 create 액션 실행해보기:
![image](https://github.com/twingay96/-api-Geocoder-/assets/64403357/307c4fe5-1fb4-40a4-b078-1ae611c3e18a)

![image](https://github.com/twingay96/-api-Geocoder-/assets/64403357/89dfceef-789b-4868-95dd-24211f20de50)

하고 기존에 생성했던 location을 edit을 할때 변경된 address를 통해 자동으로 지오코딩을 수행하게끔 코드수정:

![image](https://github.com/twingay96/-api-Geocoder-/assets/64403357/930a8a2d-f64a-4ffe-bef6-89b8fd1db6ec)


if: :address_changed?는 after_validation 콜백의 조건부 실행을 위해 사용되는 옵션입니다. 
이 조건은 Location 모델의 address 속성이 변경되었는지 여부를 체크합니다. 만약 address 속성에 변경사항이 있을 때만 :geocode 메소드를 호출하도록 지정하는 것입니다.

Rails에서 모델 속성에 _changed? 접미사를 붙이면, 해당 속성이 마지막으로 저장된 이후에 변경되었는지 여부를 반환하는 메소드가 됩니다. 
이는 "Dirty" 체킹이라고 불리며, Rails의 Active Model Dirty 모듈에서 제공하는 기능입니다.

예를 들어, address_changed? 메소드는 address 속성이 마지막 저장 이후에 변경되었으면 true를, 그렇지 않으면 false를 반환합니다.

따라서, after_validation :geocode, if: :address_changed? 코드는 다음과 같은 작동을 합니다:

        객체의 address 속성에 변화가 있을 때 (예: 새로운 주소로 업데이트 될 때)
        유효성 검사(validation)가 수행된 후에
        :geocode 메소드를 실행하여 새로운 주소에 대한 지오코딩을 수행합니다.
        이렇게 설정함으로써, 주소가 변경되었을 때만 지오코딩 프로세스를 실행하여 불필요한 API 호출을 줄이고, 성능을 향상시킬 수 있습니다. 주소가 변경되지 않았다면, 이미 저장된 위도와 경도 정보는 유효하다고 가정하고, 지오코딩을 다시 실행할 필요가 없습니다.

제대로 동작하는지 확인해보기:

    ![image](https://github.com/twingay96/-api-Geocoder-/assets/64403357/4007eba6-36cb-4238-b5db-0624dd098b90)
    ![image](https://github.com/twingay96/-api-Geocoder-/assets/64403357/8eb612ab-ae04-4867-a49a-8a754f5b5b73)

기존의 Newyork의 address를 "Tokyo, Japan"로 변경(name과 address만 변경):

![image](https://github.com/twingay96/-api-Geocoder-/assets/64403357/48466d46-3ef3-4922-80a7-fa28262dc8da)
![image](https://github.com/twingay96/-api-Geocoder-/assets/64403357/81755ff0-6e11-483a-9dfc-4bcb9ec3f785)

latitude와 longitude가 address를 기반으로 변경된 것을 확인 할수 있음.



    









































































