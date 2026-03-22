package entity;

import javax.persistence.*;
import java.math.BigDecimal;
import java.util.Date;

@Entity
@Table(name = "DON_HANG")
public class Order {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "ID_DON_HANG")
    private Integer id;

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "NGAY_DAT_HANG")
    private Date ngayTao;

    @Column(name = "TONG_TIEN_HANG")
    private BigDecimal tongTien;

    @Column(name = "TRANG_THAI")
    private String trangThai;

    @ManyToOne
    @JoinColumn(name = "ID_TAI_KHOAN")
    private TaiKhoan taiKhoan;

    // ===== constructor =====
    public Order() {}

    // ===== getter setter =====
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Date getNgayTao() {
        return ngayTao;
    }

    public void setNgayTao(Date ngayTao) {
        this.ngayTao = ngayTao;
    }

    public BigDecimal getTongTien() {
        return tongTien;
    }

    public void setTongTien(BigDecimal tongTien) {
        this.tongTien = tongTien;
    }

    public String getTrangThai() {
        return trangThai;
    }

    public void setTrangThai(String trangThai) {
        this.trangThai = trangThai;
    }

    public TaiKhoan getTaiKhoan() {
        return taiKhoan;
    }

    public void setTaiKhoan(TaiKhoan taiKhoan) {
        this.taiKhoan = taiKhoan;
    }
}
