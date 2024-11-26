package controlador;

import java.io.IOException;
import java.time.LocalDate;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import modelo.Familia;
import modelo.Usuario;
import modelo.Voluntario;

@WebServlet("/cadastro")
public class CadastroControlador extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public CadastroControlador() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String tipo = request.getParameter("tipo"); 
		String nome = request.getParameter("nome");
		String email = request.getParameter("email");
		String senha = request.getParameter("senha");
		String dataNascimento = request.getParameter("data_nascimento");
		String cidade = request.getParameter("cidade");
		String estado = request.getParameter("estado");
		String descricao = request.getParameter("descricao");
		String experiencia = request.getParameter("experiencia");
		String habilidades = request.getParameter("habilidades");
		
		boolean unico = new Usuario().isEmailUnico(email);
		System.out.println("Único?:" + unico);
		
		if(tipo != null && nome != null && email != null && senha != null && 
			dataNascimento != null &&	cidade != null && estado != null 
			&& descricao != null && unico) {
			if (tipo.equalsIgnoreCase("familia")) {
				Familia familia =  new Familia(nome, email, LocalDate.parse(dataNascimento),
						cidade, estado, descricao, "ativa");
				familia.setSenha(senha);
				familia.fazerCadastro();
				HttpSession sessao = request.getSession();
				sessao.setAttribute("familia", familia);
				response.sendRedirect("inicio-familia");
			}
			else if(tipo.equalsIgnoreCase("voluntario") && experiencia != null && habilidades != null) {
				Voluntario voluntario = new Voluntario(nome, email, LocalDate.parse(dataNascimento),
						cidade, estado, descricao, "ativa", experiencia, habilidades);
				voluntario.setSenha(senha);
				voluntario.fazerCadastro();
				HttpSession sessao = request.getSession();
				sessao.setAttribute("voluntario", voluntario);
				response.sendRedirect("inicio-voluntario");
			}
		}
	}

}
