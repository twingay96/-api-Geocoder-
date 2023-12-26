참조 : https://github.com/ankane/mapkick

![image](https://github.com/twingay96/-api-Geocoder-/assets/64403357/fd3e9e32-278a-441a-bc13-9c96d0a74b1b)
gem "mapkick-rb"추가, bundle install 실행

config/importmap.rb에 
![image](https://github.com/twingay96/-api-Geocoder-/assets/64403357/a4a967ee-c16e-4ad9-9ba9-073784af7c1c)

pin "mapkick/bundle", to: "mapkick.bundle.js"추가


importmap-rails 젬을 통해 지원되는 importmap.rb은 빌드 단계 없이 자바스크립트 모듈을 사용할 수 있게 하는 브라우저 기능입니다.
pin 메소드를 사용하면 해당 자바스크립트 파일을 모듈로써 애플리케이션의 다른 JavaScript 파일에서 import 구문을 사용하여 불러올 수 있습니다. 

    1. pin "application", preload: true:
       "application" 자바스크립트 파일을 핀 합니다. 이것은 일반적으로 Rails 애플리케이션의 메인 자바스크립트 파일입니다.
       preload: true 옵션은 이 파일을 HTML의 <head> 섹션에 미리 로드되는 모듈로 포함시키라고 Rails에 지시합니다.
       
    2. pin "@hotwired/turbo-rails", to: "turbo.min.js", preload: true:
       @hotwired/turbo-rails 패키지에서 turbo.min.js 파일을 핀 합니다. Turbo는 Hotwire 스택의 일부로, 커스텀 자바스크립트 없이도 
       실시간 사용자 상호 작용을 가능하게 하는 기능입니다. preload: true 옵션은 초기에 로드되도록 합니다.
       
    3. pin "@hotwired/stimulus", to: "stimulus.min.js", preload: true:
       Turbo 핀과 유사하게, Stimulus의 최소화 버전을 핀 합니다. Stimulus는 기존 HTML과 함께 작동하는 자바스크립트 프레임워크입니다. 
       또한 preload: true로 설정하면 초기에 로드됩니다.

    4. pin "@hotwired/stimulus-loading", to: "stimulus-loading.js", preload: true: 
       애플리케이션 내에서 로딩 표시기를 추가하는 데 사용할 수 있는 Stimulus 로딩 스크립트를 핀 합니다. 
       이것도 Hotwire 스택의 일부입니다.
       
    5. pin_all_from "app/javascript/controllers", under: "controllers": 
       app/javascript/controllers 디렉토리에 있는 모든 자바스크립트 파일을 자동으로 핀하고 "controllers" 네임스페이스 아래에서 사용할 수 있게 합니다. 
       이는 표준 Rails 7+ 애플리케이션에서 Hotwire 스택을 사용하는 Stimulus 컨트롤러에 특히 유용합니다.

    6. pin "mapkick/bundle", to: "mapkick.bundle.js": 
       mapkick 라이브러리의 번들 버전, 즉 mapkick.bundle.js 파일을 JavaScript import map에 등록하는 역할을 합니다. 
       이를 통해 Rails 애플리케이션에서 Mapkick 라이브러리를 쉽게 사용할 수 있도록 합니다.

  Import map의 핵심적인 이점은, 서버에서 관리되는 매핑을 통해 클라이언트 측 JavaScript가 모듈을 불러올 때 필요한 URL을 알 수 있다는 것입니다. 
  이는 웹 개발자가 번들러나 컴파일러 없이도 모듈 기반의 개발을 할 수 있도록 해주며, 브라우저가 모듈을 더 효율적으로 불러올 수 있게 해줍니다.

import "mapkick/bundle"을 application.js에 추가:

![image](https://github.com/twingay96/-api-Geocoder-/assets/64403357/89ee2aa6-42b0-40fe-90fb-d678a3a012f1)

후에 access_token일 가져오기:
![image](https://github.com/twingay96/-api-Geocoder-/assets/64403357/c2421a7c-5d05-4d68-b1fd-1344579d906d)
![image](https://github.com/twingay96/-api-Geocoder-/assets/64403357/6e878b28-1ef0-4a12-acd8-1ead12556fef)

config/application.rb에 다음과 같이 추가하거나:

![image](https://github.com/twingay96/-api-Geocoder-/assets/64403357/b9e39c61-69bf-4aab-8579-9a99a80e2cc2)

혹은 깃허브에서 설명한대로 initializer에 다음과 mapbox.rb를 생성하고 코드추가:

![image](https://github.com/twingay96/-api-Geocoder-/assets/64403357/2041c4fe-61b4-409e-a193-1fb7aa5d681d)
![image](https://github.com/twingay96/-api-Geocoder-/assets/64403357/5c4b0a0a-f5cf-4ec3-a575-aee066bd35f5)

이제 모든세팅을 완료했음으로 index(뷰파일)에 

![image](https://github.com/twingay96/-api-Geocoder-/assets/64403357/6d00e4ae-ab89-4285-9104-96f308089322)

둘중 하나를 추가하고 rails s실행하여 동작확인:
![image](https://github.com/twingay96/-api-Geocoder-/assets/64403357/0bbc693d-36a0-4d51-a39b-51d04f443488)

![image](https://github.com/twingay96/-api-Geocoder-/assets/64403357/83a5fb00-0acc-43a0-bf47-a6908c29697c)

여기서 몇개의 옵션(라벨, 툴팁, 등등)을 사용해보기:
![image](https://github.com/twingay96/-api-Geocoder-/assets/64403357/6d16aa9b-7ae7-44e7-91e8-f2b448bdd3bd)
![image](https://github.com/twingay96/-api-Geocoder-/assets/64403357/69c1c040-b596-4ee2-93d4-6e35528c4e82)

이때 빨강색 "[ ]" 부분은 data array이고 뒷 부분은 기타옵션:
![image](https://github.com/twingay96/-api-Geocoder-/assets/64403357/fed9a55d-1ef4-448e-a5ac-4094aa1d62e2)

![image](https://github.com/twingay96/-api-Geocoder-/assets/64403357/bc93b5ac-eab8-47bb-b805-8d1020014325)
![image](https://github.com/twingay96/-api-Geocoder-/assets/64403357/f81e3b1c-16c3-46dd-8517-2a7a79e8d36b)

이제 각자의 location에 지도 반영하기:
![image](https://github.com/twingay96/-api-Geocoder-/assets/64403357/73bd2c2e-0b93-42eb-89cf-415069063282)

![image](https://github.com/twingay96/-api-Geocoder-/assets/64403357/9e2afcad-d9dd-467d-a444-7a5bbedcf08f)

tooltip을 클릭했을때 해당 location의 show페이지로 이동할 수 있게 끔 하기(tooltip이 click가능 하도록 viewhelper에 구현):
![image](https://github.com/twingay96/-api-Geocoder-/assets/64403357/ea54faf5-9c3e-4617-922c-e4ec77767189)
![image](https://github.com/twingay96/-api-Geocoder-/assets/64403357/2b42d5eb-13a2-4f74-9b04-eab04ace188c)
![image](https://github.com/twingay96/-api-Geocoder-/assets/64403357/baac1a6a-56b8-4cd5-ad52-76d1597d184a)

모든 위치정보를 지도에 표시하기 위해서 데이터를 담고있는 배열부분을 json데이터로 수정:
![image](https://github.com/twingay96/-api-Geocoder-/assets/64403357/4f3953d2-a035-41ca-8755-e006de40dc24)
![image](https://github.com/twingay96/-api-Geocoder-/assets/64403357/db7a21c8-cb63-4440-8b8a-ca965b706a1a)

![image](https://github.com/twingay96/-api-Geocoder-/assets/64403357/be30b6a4-e806-4d6b-8720-a6fee009e138)


locations_path(format: :json)으로 요청을 하면 LocationsControllerd의 index 액션에 정의 된대로 처리가 되고, @locations변수에 담긴 위치데이터가
JSON형식으로 변환 됩니다. 이때 index.json.jbuilder뷰 파일이 사용되어 @loactions 배열 안의 각 데이터를 JSON배열로 구성하게 됩니다.
즉 geocoder의 형식에 맞는 json배열 ( 현재 Location의 컬럼이 name, address , lat .long으로 구성된 상태)을 반환하면 라이브러리에서 알아서 js가 입혀진 map을 생성함

![image](https://github.com/twingay96/-api-Geocoder-/assets/64403357/158b9cfb-34e7-4f58-8163-debbf9120104)

이때 partial할때의  render @locations 문법과 비슷하게 @locations의 내부 하나의 객체를 location 이라는 변수명으로 하나씩 할당함

![image](https://github.com/twingay96/-api-Geocoder-/assets/64403357/74d909d3-244e-495e-acf1-61398795ec85)
Jbuilder를 사용하여 Json 구조를 정의하는코드, json.extract! 메서드는 location 객체이서 latitude와 longtitude속성을 추출
json.title은 location의 name속성을 제목으로 설정, json.tooltip은 html_link_to헬퍼 메서드를 사용하여 지정된 location에 대한 html 링크를 툴팁으로 설정

![image](https://github.com/twingay96/-api-Geocoder-/assets/64403357/757e3b5a-8f7e-4006-8b93-ec7c1aac3b5f)

현재 상태에서는 검색하였을때 모든 지역이 출력되되기에 이를수정:
![image](https://github.com/twingay96/-api-Geocoder-/assets/64403357/b6617cd0-e5d4-4723-ba62-45fe325d8a9b)
![image](https://github.com/twingay96/-api-Geocoder-/assets/64403357/7c992c80-923c-4ed3-9750-098a22bcc3a6)

params[:place]와 params[:distance]를 추가하면 다음과 같이 해당지역만 표시가됨
![image](https://github.com/twingay96/-api-Geocoder-/assets/64403357/5e14fa03-d5db-41a6-8203-2b37239fa17e)





























    
