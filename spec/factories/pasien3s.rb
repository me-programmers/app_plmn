# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :pasien3 do
    id_pasien "MyString"
    nama_pasien "MyString"
    pangkat_jabatan "MyString"
    jenis_kelamin 1
    umur 1
    id_sample "MyString"
    tanggal "2013-08-06"
    ruangan "MyString"
    pemeriksa "MyString"
    komentar "MyText"
    id_echantillon 1
  end
end
