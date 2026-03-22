package entity;

import javax.persistence.*;
import java.math.BigDecimal;

@Entity
@Table(name = "MA_GIAM_GIA")
public class Discount {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "ID_MA_GIAM_GIA")
    private Integer id;

    @Column(name = "MA_CODE", nullable = false, unique = true)
    private String code;

    @Column(name = "GIA_TRI_GIAM", nullable = false)
    private BigDecimal value;

    @Column(name = "TRANG_THAI")
    private Boolean active;

    // ===== GET / SET =====
    public Integer getId() { return id; }
    public void setId(Integer id) { this.id = id; }

    public String getCode() { return code; }
    public void setCode(String code) { this.code = code; }

    public BigDecimal getValue() { return value; }
    public void setValue(BigDecimal value) { this.value = value; }

    public Boolean getActive() { return active; }
    public void setActive(Boolean active) { this.active = active; }
}
