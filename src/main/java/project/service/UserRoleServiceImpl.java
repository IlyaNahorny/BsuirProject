package project.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import project.dao.UserRoleDao;
import project.model.UserRole;

import javax.transaction.Transactional;

/**
 * Created by Ilya on 13.02.2016.
 */
@Transactional
@Service
public class UserRoleServiceImpl implements UserRoleService {

    @Autowired
    private UserRoleDao userRoleDao;

    public void add(UserRole userRole) {
        userRoleDao.add(userRole);
    }
}
