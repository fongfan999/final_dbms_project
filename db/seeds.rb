unless Location.any?
  Location.create!([
    {name: 'Hà Nội  (HAN)'},
    {name: 'Hải Phòng (HPH)'},
    {name: 'Điện Biên (DIN)'},
    {name: 'Hồ Chí Minh  (SGN)'},
    {name: 'Phú Quốc (PQC)'},
    {name: 'Côn Đảo (VCS)'},
    {name: 'Cần Thơ (VCA)'},
    {name: 'Cà Mau (CAH)'},
    {name: 'Rạch Giá (VKG)'},
    {name: 'Đà Nẵng (DAD)'},
    {name: 'Nha Trang (CXR)'},
    {name: "Đà Lạt (DLI)"},
    {name: "Vinh (VII)"},
    {name: "Huế (HUI)"},
    {name: "Thanh Hóa (THD)"},
    {name: "Ban Mê Thuột (BMV)"},
    {name: "Pleiku (PXU)"},
    {name: "Qui Nhơn (UIH)"},
    {name: "Đồng Hới (VDH)"},
    {name: "Tuy Hòa (TBB)"},
    {name: "Chu Lai (VCL)"}
  ])
end