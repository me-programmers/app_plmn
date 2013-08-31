# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :hasil3 do
    hsl_echantillon 1
    hsl_item "MyString"
    hsl_result 1.5
    hsl_batas_bawah 1.5
    hsl_batas_atas 1.5
    hsl_posisi_desimal 1
    hsl_id_pasien "MyString"
    hsl_lab_item_name "MyString"
    hsl_lab_satuan "MyString"
    hsl_lab_item_order "MyString"
    hsl_lab_nilai_normal "MyString"
  end
end
