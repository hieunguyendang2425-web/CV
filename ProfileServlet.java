package Controller;

import model.Profile;
import model.Skill;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Arrays;
import java.util.List;

@WebServlet("/profile")
public class ProfileServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Tạo danh sách kỹ năng mẫu
        List<Skill> skills = Arrays.asList(
                new Skill("Java", "Thành thạo Java core & servlet", "blue-500"),
                new Skill("Spring Boot", "Xây dựng RESTful API với Spring", "green-500"),
                new Skill("SQL", "Kinh nghiệm làm việc với MySQL & MSSQL", "red-500"),
                new Skill("HTML/CSS/JS", "Phát triển giao diện web hiện đại", "yellow-500")
        );

        // About details
        List<String> aboutDetails = Arrays.asList(
                "Tốt nghiệp chuyên ngành CNTT",
                "2 năm kinh nghiệm phát triển Java web",
                "Đam mê học hỏi và công nghệ mới"
        );

        // Tạo đối tượng Profile
        Profile profile = new Profile(
                "Nguyễn Đăng Hiệu",
                "hieu33@gmail.com",
                "0123456789",
                "Huế, Việt Nam",
                "Java Developer",
                "Một lập trình viên yêu thích công nghệ và sáng tạo.",
                "Tôi luôn muốn học hỏi và áp dụng kiến thức mới để phát triển ứng dụng hiệu quả hơn.",
                aboutDetails,
                skills
        );

        // Set Attribute để JSP dùng
        request.setAttribute("profile", profile);

        // Forward sang view
        request.getRequestDispatcher("/views/profile.jsp").forward(request, response);
    }
}
