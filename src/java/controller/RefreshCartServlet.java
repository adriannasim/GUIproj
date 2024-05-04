import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import entity.CartItem;
//import com.google.gson.Gson;

@WebServlet("/RefreshCartServlet")
public class RefreshCartServlet extends HttpServlet {
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
    
    // Retrieve updated cart items from the request attribute
    ArrayList<CartItem> cartItemList = (ArrayList<CartItem>) request.getAttribute("cartItemList");
    
    // Convert cartItemList to JSON format
    Gson gson = new Gson();
    String cartItemsJson = gson.toJson(cartItemList);
    
    // Set content type
    response.setContentType("application/json");
    
    // Write the JSON content to the response
    try (PrintWriter out = response.getWriter()) {
        out.println(cartItemsJson);
    }
}
}
