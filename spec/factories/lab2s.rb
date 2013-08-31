# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :lab2 do
    lab_item "MyString"
    lab_satuan "MyString"
    lab_batas_pl 1.5
    lab_batas_ph 1.5
    lab_batas_ll 1.5
    lab_batas_lh 1.5
    lab_nilai_normal "MyString"
    lab_posisi_desimal 1
    lab_item_order 1
  end
end
