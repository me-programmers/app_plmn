# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :pasien do
    IdPasien "MyString"
    NamaPasien "MyString"
    PangkatJabatan "MyString"
    JenisKelamin "MyString"
    IdSample "MyString"
    Tanggal "2013-07-22"
    Ruangan "MyString"
    Pemeriksa "MyString"
    Komentar ""
    IdEchantillon 1
  end
end
