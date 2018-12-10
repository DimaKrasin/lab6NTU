package lab6.Servises;

import lab6.DBConnectionManager;
import lab6.Entity.User;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserServiseDAOImpl implements UserServiseDAO {

    Connection connection;

    public UserServiseDAOImpl() {

        DBConnectionManager connectionManager;
        try {
            connectionManager = new DBConnectionManager();
            this.connection = connectionManager.getConnection();
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }

    }

    @Override
    public User getUserById(long id) {

        try (
                Statement stmt = connection.createStatement();
                ResultSet rs = stmt.executeQuery("SELECT * FROM user WHERE id=" + id);
        ) {
            if (rs.next()) {
                return extractUserFromResultSet(rs);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();

        }
        return null;
    }

    @Override
    public User getUserByLoginAndPassword(String login, String password) {

        try (
                PreparedStatement ps = connection.prepareStatement
                        ("SELECT * FROM user WHERE login=? AND password=?")) {

            ps.setString(1, login);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return extractUserFromResultSet(rs);
            }


        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return null;
    }

    @Override
    public List<User> getAllUsers() {

        try (
             Statement stmt = connection.createStatement();
             ResultSet rs = stmt.executeQuery("SELECT * FROM user");
        ) {

            List<User> users = new ArrayList<>();

            while (rs.next()) {
                User user = extractUserFromResultSet(rs);
                users.add(user);
            }

            return users;

        } catch (SQLException ex) {
            ex.printStackTrace();

        }

        return null;
    }

    @Override
    public boolean insertUser(User user) {

        try (
             PreparedStatement ps = connection.prepareStatement
                     ("INSERT INTO User(login, password, name, role) VALUES (?,?, ?, ?)");
        ) {

            ps.setString(1, user.getLogin());
            ps.setString(2, user.getPassword());
            ps.setString(3, user.getName());
            ps.setString(4, user.getRole());


            int i = ps.executeUpdate();

            if (i == 1) {

                return true;

            }

        } catch (SQLException ex) {

            ex.printStackTrace();

        }

        return false;
    }

    @Override
    public boolean updateUserPassword(User user) {


        try (
             PreparedStatement ps = connection.prepareStatement
                     ("UPDATE user set password = ? WHERE id=?");
        ) {
            ps.setString(1, user.getPassword());
            ps.setLong(2, user.getId());

            int i = ps.executeUpdate(); // for INSERT, UPDATE & DELETE

            if (i == 1) {

                return true;

            }

        } catch (SQLException ex) {

            ex.printStackTrace();

        }

        return false;
    }

    @Override
    public boolean deleteUser(long id) {

        //try-with-resources
        try (//Connection connection = ConnectionFactory.getConnection();
             PreparedStatement ps = connection.prepareStatement("DELETE FROM user WHERE id=?");
        ) {

            ps.setLong(1, id);

            int i = ps.executeUpdate(); // for INSERT, UPDATE & DELETE

            if (i == 1) {

                return true;

            }

        } catch (SQLException ex) {

            ex.printStackTrace();

        }

        return false;
    }

    private User extractUserFromResultSet(ResultSet rs) throws SQLException {

        User user = new User();
        user.setId(rs.getLong("id"));
        user.setName( rs.getString("name") );
        user.setPassword( rs.getString("password") );
        user.setRole( rs.getString("role") );
        user.setLogin( rs.getString("login") );

        return user;
    }


}

