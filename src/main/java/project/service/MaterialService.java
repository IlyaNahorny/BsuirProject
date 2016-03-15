package project.service;

import project.model.Material;

/**
 * Created by Ilya on 22.02.2016.
 */
public interface MaterialService {
    public void addMaterial(Material material);
    Material getMaterialByMaterialName(String materialName);
}
