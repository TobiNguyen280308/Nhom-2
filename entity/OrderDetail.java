package entity;

import javax.persistence.*;
import java.math.BigDecimal;

@Entity
@Table(name = "CHI_TIET_DON_HANG")
public class OrderDetail {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "ID_CHI_TIET_DON_HANG")
    private Integer id;

    @ManyToOne
    @JoinColumn(name = "ID_DON_HANG", nullable = false)
    private Order order;

    @ManyToOne
    @JoinColumn(name = "ID_SAN_PHAM", nullable = false)
    private SanPham sanPham;

    @Column(name = "SO_LUONG", nullable = false)
    private Integer soLuong;

    @Column(name = "DON_GIA", precision = 10, scale = 2, nullable = false)
    private BigDecimal donGia;

    // ===== GET SET =====
    public Integer getId() {
        return id;
    }

    public Order getOrder() {
        return order;
    }

    public void setOrder(Order order) {
        this.order = order;
    }

    public SanPham getSanPham() {
        return sanPham;
    }

    public void setSanPham(SanPham sanPham) {
        this.sanPham = sanPham;
    }

    public Integer getSoLuong() {
        return soLuong;
    }

    public void setSoLuong(Integer soLuong) {
        this.soLuong = soLuong;
    }

    public BigDecimal getDonGia() {
        return donGia;
    }

    public void setDonGia(BigDecimal donGia) {
        this.donGia = donGia;
    }
}
