package entity;

import javax.persistence.*;

@Entity
@Table(name = "TAI_KHOAN")
public class TaiKhoan {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "ID_TAI_KHOAN")
    private Integer id;

    @Column(name = "TEN_DANG_NHAP")
    private String tenDangNhap;

    @Column(name = "MAT_KHAU")
    private String matKhau;

    @Column(name = "VAI_TRO")
    private String vaiTro;

    @Column(name = "TRANG_THAI")
    private Boolean trangThai;

    // ===== GETTER / SETTER =====

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTenDangNhap() {
        return tenDangNhap;
    }

    public void setTenDangNhap(String tenDangNhap) {
        this.tenDangNhap = tenDangNhap;
    }

    public String getMatKhau() {
        return matKhau;
    }

    public void setMatKhau(String matKhau) {
        this.matKhau = matKhau;
    }

    public String getVaiTro() {
        return vaiTro;
    }

    public void setVaiTro(String vaiTro) {
        this.vaiTro = vaiTro;
    }

    public Boolean getTrangThai() {
        return trangThai;
    }

    public void setTrangThai(Boolean trangThai) {
        this.trangThai = trangThai;
    }
}


