# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :hasil do
    item_pemeriksaan "MyString"
    hasil_pemeriksaan 1.5
    satuan "MyString"
    an_echantillon 1
    normal_pl 1.5
    normal_ph 1.5
    normal_ll 1.5
    normal_lh 1.5
    faktor_pengali 1.5
    posisi_desimal 1
    pasien nil
  end
end
