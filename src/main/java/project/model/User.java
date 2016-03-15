package project.model;

import com.fasterxml.jackson.annotation.JsonAutoDetect;
import com.fasterxml.jackson.annotation.JsonProperty;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;
import java.util.Set;

@Entity
@Table(name = "users")
@JsonAutoDetect(fieldVisibility = JsonAutoDetect.Visibility.NONE, getterVisibility = JsonAutoDetect.Visibility.NONE)
public class User implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @JsonProperty
    private Integer id;

    @Column(name = "username", length = 25, nullable = false, unique = true)
    @JsonProperty
    private String username;

    @Column(name = "password", nullable = false)
    @JsonProperty
    private String password;

    @Column(name = "enabled", nullable = false)
    @JsonProperty
    private boolean enabled;

    @Column(name = "firstName", nullable = false)
    @JsonProperty
    private String firstName;

    @Column(name = "style", nullable = false)
    @JsonProperty
    private String style;

    @Column(name = "lastName", nullable = false)
    @JsonProperty
    private String lastName;

    @Column(name = "url")
    @JsonProperty
    private String url;

    @Column(name = "city")
    @JsonProperty
    private String city;

    @Column(name = "job")
    @JsonProperty
    private String job;

    @JsonProperty
    @OneToMany(orphanRemoval = true, mappedBy = "user", cascade = {CascadeType.REMOVE}, fetch = FetchType.EAGER)
    private Set<UserRole> userRoles;

    @JsonProperty
    @OneToMany(orphanRemoval = true, mappedBy = "user", cascade = {CascadeType.REMOVE}, fetch = FetchType.EAGER)
    private Set<Material> materials;


    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }


    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getStyle() {
        return style;
    }

    public void setStyle(String style) {
        this.style = style;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public Set<Material> getMaterials() {
        return materials;
    }

    public void setMaterials(Set<Material> materials) {
        this.materials = materials;
    }

    public Set<UserRole> getUserRoles() {
        return userRoles;
    }

    public void setUserRoles(Set<UserRole> userRoles) {
        this.userRoles = userRoles;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getJob() {
        return job;
    }

    public void setJob(String job) {
        this.job = job;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public boolean isEnabled() {
        return enabled;
    }

    public void setEnabled(boolean enabled) {
        this.enabled = enabled;
    }


}
