package model;

import entity.SanPham;
import java.math.BigDecimal;

public class CartItem {

    private SanPham sanPham;
    private int soLuong;

    public CartItem() {}

    public CartItem(SanPham sanPham, int soLuong) {
        this.sanPham = sanPham;
        this.soLuong = soLuong;
    }

    public SanPham getSanPham() {
        return sanPham;
    }

    public void setSanPham(SanPham sanPham) {
        this.sanPham = sanPham;
    }

    public int getSoLuong() {
        return soLuong;
    }

    public void setSoLuong(int soLuong) {
        this.soLuong = soLuong;
    }

    public BigDecimal getThanhTien() {
        return sanPham.getGia().multiply(BigDecimal.valueOf(soLuong));
    }
}
