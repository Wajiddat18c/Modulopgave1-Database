import java.sql.*;


public class ModulOpg {

    public static void main(String[] args) {

        InputHandler input = new InputHandler();

        int valg = 0;

        System.out.println("Dette er et lille søge program." +
                "\n Redigere selv programet efter hvilke søge resultater du ønsker" +
                "\n tast 1 for at søge: ");

            //query info
            String query = "select *" +
                    "From areatil join yearcounttil join datatil join gendertil" +
                    " where tilflytningskommune = 'København'" +
                    // "and fraflytningskommune = 'Vallensbæk'" +
                    "and yearcount = 2007" +
                    " and gender = 'mænd'" +
                    " and data = 145";



            String dbUrl = "jdbc:mysql://localhost:3306/modulopg";
            String username = "root";
            String password = "password";

            //JDBC objekter
            try {
                Connection conn = DriverManager.getConnection(dbUrl, username, password);
                Statement st = conn.createStatement();
                st.setMaxRows(5000);
                ResultSet rs = st.executeQuery(query);
                //Udskriv resultatsæt
                //kør igennem resultatsættet

                valg = input.readInt();
                if (valg == 1) {
                while (rs.next()) {
                    String bynavn = rs.getString("fraflytningskommune");
                    String navn = rs.getString("yearcount");
                    int data = rs.getInt("data");
                    System.out.println(bynavn + " " + navn + " " + data);
                }
                }
                conn.close();
            } catch (SQLException e) {
                System.out.println("SQL Error " + e.getMessage());
            }
        }
    }

