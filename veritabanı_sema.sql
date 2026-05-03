-- 1. Müşteri Tablosu
CREATE TABLE Musteri (
    musteri_id INT PRIMARY KEY AUTO_INCREMENT,
    ad VARCHAR(50) NOT NULL,
    soyad VARCHAR(50) NOT NULL,
    telefon VARCHAR(15)
);

-- 2. Personel Tablosu
CREATE TABLE Personel (
    personel_id INT PRIMARY KEY AUTO_INCREMENT,
    ad VARCHAR(50) NOT NULL,
    soyad VARCHAR(50) NOT NULL,
    gorev VARCHAR(50)
);

-- 3. İlaç Tablosu
CREATE TABLE Ilac (
    ilac_id INT PRIMARY KEY AUTO_INCREMENT,
    ilac_adi VARCHAR(100) NOT NULL,
    barkod VARCHAR(50) UNIQUE NOT NULL,
    fiyat DECIMAL(10, 2) NOT NULL,
    stok_miktari INT NOT NULL,
    son_kullanma_tarihi DATE
);

-- 4. Satış Tablosu
CREATE TABLE Satis (
    satis_id INT PRIMARY KEY AUTO_INCREMENT,
    musteri_id INT,
    personel_id INT,
    satis_tarihi DATETIME DEFAULT CURRENT_TIMESTAMP,
    toplam_tutar DECIMAL(10, 2),
    FOREIGN KEY (musteri_id) REFERENCES Musteri(musteri_id),
    FOREIGN KEY (personel_id) REFERENCES Personel(personel_id)
);

-- 5. Satış Detay Tablosu
CREATE TABLE Satis_Detay (
    satis_detay_id INT PRIMARY KEY AUTO_INCREMENT,
    satis_id INT,
    ilac_id INT,
    adet INT NOT NULL,
    birim_fiyat DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (satis_id) REFERENCES Satis(satis_id),
    FOREIGN KEY (ilac_id) REFERENCES Ilac(ilac_id)
);

-- 6. Reçete Tablosu
CREATE TABLE Recete (
    recete_id INT PRIMARY KEY AUTO_INCREMENT,
    musteri_id INT,
    doktor_adi VARCHAR(100),
    recete_tarihi DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (musteri_id) REFERENCES Musteri(musteri_id)
);

-- 7. Reçete_İlaç Tablosu
CREATE TABLE Recete_Ilac (
    recete_ilac_id INT PRIMARY KEY AUTO_INCREMENT,
    recete_id INT,
    ilac_id INT,
    doz_bilgisi VARCHAR(255),
    FOREIGN KEY (recete_id) REFERENCES Recete(recete_id),
    FOREIGN KEY (ilac_id) REFERENCES Ilac(ilac_id)
);

-- 8. Stok Hareket Tablosu
CREATE TABLE Stok_Hareket (
    stok_hareket_id INT PRIMARY KEY AUTO_INCREMENT,
    ilac_id INT,
    hareket_turu VARCHAR(50), -- Örn: 'Giriş', 'Çıkış', 'İade' vb.
    adet INT NOT NULL,
    tarih DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (ilac_id) REFERENCES Ilac(ilac_id)
);