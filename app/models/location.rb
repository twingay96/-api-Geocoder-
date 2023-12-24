class Location < ApplicationRecord
    geocoded_by :address
    after_validation :geocode , if: :address_changed?# 주소가 유효성 검사를 통과한 후 지오코딩 실행

    validates :name, presence: true
    validates :address, presence: true

    validate :address_must_be_geocodable # 사용자 정의 유효성 검사(custom validation)를 

    def address_must_be_geocodable
        # Geocoder를 사용하여 주소 조회를 시도합니다.
        results = Geocoder.search(self.address)
        # 결과가 없거나 주소가 조회되지 않으면 에러를 추가합니다.
        if results.empty?
          errors.add(:address, "는 조회되지 않는 주소입니다.")
        end
      end
end
