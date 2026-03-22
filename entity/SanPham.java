package entity;

import javax.persistence.*;
import java.math.BigDecimal;

@Entity
@Table(name = "SAN_PHAM")
public class SanPham {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "ID_SAN_PHAM")
    private Integer idSanPham;

    @ManyToOne
    @JoinColumn(name = "ID_TAI_KHOAN")
    private TaiKhoan taiKhoan;

    @Column(name = "TEN_SAN_PHAM")
    private String tenSanPham;

    @Column(name = "MO_TA")
    private String moTa;

    @Column(name = "GIA")
    private BigDecimal gia;

    @Column(name = "SO_LUONG")
    private Integer soLuong;

    // ====== CONSTRUCTOR ======
    public SanPham() {
    }

    // ====== GETTER & SETTER ======

    public Integer getIdSanPham() {
        return idSanPham;
    }

    public void setIdSanPham(Integer idSanPham) {
        this.idSanPham = idSanPham;
    }

    public TaiKhoan getTaiKhoan() {
        return taiKhoan;
    }

    public void setTaiKhoan(TaiKhoan taiKhoan) {
        this.taiKhoan = taiKhoan;
    }

    public String getTenSanPham() {
        return tenSanPham;
    }

    public void setTenSanPham(String tenSanPham) {
        this.tenSanPham = tenSanPham;
    }

    public String getMoTa() {
        return moTa;
    }

    public void setMoTa(String moTa) {
        this.moTa = moTa;
    }

    public BigDecimal getGia() {
        return gia;
    }

    public void setGia(BigDecimal gia) {
        this.gia = gia;
    }

    public Integer getSoLuong() {
        return soLuong;
    }

    public void setSoLuong(Integer soLuong) {
        this.soLuong = soLuong;
    }
}
