package project.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import project.dao.MaterialDao;
import project.model.Material;

import javax.transaction.Transactional;

/**
 * Created by Ilya on 22.02.2016.
 */
@Service
@Transactional
public class MaterialServiceImpl implements MaterialService {

    @Autowired
    private MaterialDao materialDao;

    public Material getMaterialByMaterialName(String materialName) {
        Material material = materialDao.getMaterialByMaterialName(materialName);
        return material;
    }

    public Material getMaterialById(Integer id) {
        return materialDao.getMaterialById(id);
    }

    public void addMaterial(Material material) {
//        material.setTemplate("template1");
        materialDao.addMaterial(material);
    }
}
