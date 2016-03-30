package project.dao;

import org.springframework.stereotype.Repository;
import project.model.Material;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;
import java.util.List;

/**
 * Created by Ilya on 22.02.2016.
 */
@Repository
public class MaterialDaoImpl implements MaterialDao{

    @PersistenceContext
    private EntityManager entityManager;

    public List<Material> getAllMaterials(String username) {
        List<Material> materials = entityManager.createQuery("from Material", Material.class).getResultList();
        return materials;
    }

    public Material getMaterialByMaterialName(String materialName) {
        Material material;
        try{
            material = entityManager.createQuery("SELECT m FROM Material m WHERE m.materialName =: materialName", Material.class)
                    .setParameter("materialName", materialName).getSingleResult();
            return material;
        }catch (NoResultException nre){
            return null;
        }
    }

    public Material getMaterialById(Integer id) {
        return entityManager.find(Material.class, id);
    }

    public void addMaterial(Material material) {
        entityManager.persist(material);
    }

    public void updateMaterialRating(Integer id, int value) {
            Material material = entityManager.getReference(Material.class,id);
            material.setRating(value);
    }
}
