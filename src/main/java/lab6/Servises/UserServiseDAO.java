package lab6.Servises;

import lab6.Entity.User;

import java.util.List;

public interface UserServiseDAO {

    User getUserById(long id);
    User getUserByLoginAndPassword(String login, String password);
    List<User> getAllUsers();
    boolean insertUser(User user);
    boolean updateUserPassword(User user);
    boolean deleteUser(long id);
}
