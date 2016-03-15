package project.dao;

import org.springframework.stereotype.Repository;
import project.model.UserRole;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 * Created by Ilya on 13.02.2016.
 */
@Repository
public class UserRoleDaoImpl implements UserRoleDao {

    @PersistenceContext
    private EntityManager entityManager;

    public void add(UserRole userRole) {
        entityManager.persist(userRole);
    }
}
