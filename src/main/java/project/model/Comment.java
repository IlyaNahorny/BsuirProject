package project.model;

import com.fasterxml.jackson.annotation.JsonAutoDetect;
import com.fasterxml.jackson.annotation.JsonProperty;

import javax.persistence.*;
import java.io.Serializable;


@Entity
@Table(name="comments")
@JsonAutoDetect(fieldVisibility = JsonAutoDetect.Visibility.NONE, getterVisibility = JsonAutoDetect.Visibility.NONE)
public class Comment implements Serializable{

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @JsonProperty
    private Integer id_comment;

    @Column(name = "text", nullable = false)
    @JsonProperty
    private String text;

    @Column(name = "userName", nullable = false)
    @JsonProperty
    private String userName;

    @ManyToOne(optional = false)
    @JoinColumn(name = "id_material", referencedColumnName = "id_material", foreignKey = @ForeignKey(ConstraintMode.NO_CONSTRAINT))
    private Material material;

    public Integer getId_comment() {
        return id_comment;
    }

    public void setId_comment(Integer id_comment) {
        this.id_comment = id_comment;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public String getUsername() {
        return userName;
    }

    public void setUsername(String userName) {
        this.userName = userName;
    }

    public Material getMaterial() {
        return material;
    }

    public void setMaterial(Material material) {
        this.material = material;
    }
}
