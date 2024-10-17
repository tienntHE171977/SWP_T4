import DAL_Authen.VerificationTokenDAO;
import org.junit.jupiter.api.*;
import static org.junit.jupiter.api.Assertions.*;

public class VerificationTokenDAOtest {

    private VerificationTokenDAO verificationTokenDAO;

    @BeforeAll
    public static void setUpClass() {
        // Thiết lập các tài nguyên cần thiết cho toàn bộ lớp test
    }

    @BeforeEach
    public void setUp() {
        // Khởi tạo đối tượng cần kiểm thử trước mỗi test case
        verificationTokenDAO = new VerificationTokenDAO();
    }

    @AfterEach
    public void tearDown() {
        // Dọn dẹp sau mỗi test case nếu cần
    }

    @Test
    public void testGenerateAndSaveVerificationToken() {
        int userId = 1; // Giả định rằng userId này tồn tại trong cơ sở dữ liệu kiểm thử

        String token = verificationTokenDAO.generateAndSaveVerificationToken(userId);
        assertNotNull(token, "Token không được null");
        assertFalse(token.isEmpty(), "Token không được rỗng");

        // Kiểm tra xem token có thể được lấy lại từ cơ sở dữ liệu
        Integer retrievedUserId = verificationTokenDAO.getUserIdByToken(token);
        assertEquals(userId, retrievedUserId, "UserId không khớp");
    }

    @Test
    public void testGetUserIdByToken() {
        // Giả định rằng có một token hợp lệ trong cơ sở dữ liệu
        String validToken = "c40889ed-cb6f-4c3d-a8ba-7dd5b18d155a"; // Thay thế bằng token thực tế
        Integer expectedUserId = 41; // Thay thế bằng userId thực tế tương ứng với token

        Integer actualUserId = verificationTokenDAO.getUserIdByToken(validToken);
        assertEquals(expectedUserId, actualUserId, "UserId không khớp với token hợp lệ");

        // Kiểm tra với token không hợp lệ
        String invalidToken = "c40889ed-cb6f-4c3d-a8ba-7dd5b18d155a";
        Integer invalidUserId = verificationTokenDAO.getUserIdByToken(invalidToken);
        assertNull(invalidUserId, "UserId phải là null với token không hợp lệ");
    }

    @Test
    public void testIsUserVerified() {
        int userId = 1; // Giả định rằng userId này tồn tại trong cơ sở dữ liệu kiểm thử

        // Giả định rằng người dùng này chưa được xác thực
        boolean isVerified = verificationTokenDAO.isUserVerified(userId);
        assertFalse(isVerified, "Người dùng không nên được xác thực");

        // Sau đó, bạn có thể thử kích hoạt tài khoản và kiểm tra lại
        verificationTokenDAO.activateUserAccount(userId);
        isVerified = verificationTokenDAO.isUserVerified(userId);
        assertTrue(isVerified, "Người dùng nên được xác thực sau khi kích hoạt");
    }
}
