class Location < ApplicationRecord
    geocoded_by :address
    after_validation :geocode # 주소가 유효성 검사를 통과한 후 지오코딩 실행
end
