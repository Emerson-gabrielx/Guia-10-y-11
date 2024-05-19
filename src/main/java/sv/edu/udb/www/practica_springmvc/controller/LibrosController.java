package sv.edu.udb.www.practica_springmvc.controller;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import sv.edu.udb.www.practica_springmvc.model.LibrosModel;
import sv.edu.udb.www.practica_springmvc.model.AutoresModel;
import sv.edu.udb.www.practica_springmvc.model.EditorialesModel;
import sv.edu.udb.www.practica_springmvc.model.GenerosModel;
import org.springframework.ui.Model;
import sv.edu.udb.www.practica_springmvc.entities.LibrosEntity;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import static org.springframework.web.bind.annotation.RequestMethod.*;

@Controller
@RequestMapping("libros")
public class LibrosController {

    EditorialesModel editorialesModel = new EditorialesModel();
    GenerosModel generosModel = new GenerosModel();
    AutoresModel autoresModel = new AutoresModel();
    LibrosModel librosModel = new LibrosModel();
    @RequestMapping(value = "list", method = GET)
    public String listarLibros(ModelMap modelMap){
//Pasando la lista de editoriales hacia la vista
        modelMap.addAttribute("listaLibros", librosModel.listarLibros());
//Redireccionando a la página de libros.jsp
        return "libros/listar";
    }

    @RequestMapping(value = "create", method = GET)
    public String nuevoLibro(Model model){
        //Se le pasa a la vista el objeto que debe llenarse desde el formuario
        model.addAttribute("libro", new LibrosEntity());
        //Se le pasa a la vista las listas de autores, géneros y editoriales
        //Para llenar los campos select
        model.addAttribute("listaAutores",autoresModel.listarAutores());
        model.addAttribute("listaGeneros",generosModel.listarGeneros());
        model.addAttribute("listaEditoriales",editorialesModel.listarEditoriales());
        return "libros/nuevo";
    }
    @RequestMapping(value = "create", method = POST)
    public String insertarLibro(@ModelAttribute("libro") LibrosEntity libro, Model model,
                                RedirectAttributes atributos) {
        if(librosModel.insertarLibro(libro)>0){
            //Si se insertó, se pasa el mensaje de éxito
            atributos.addFlashAttribute("exito","Libro registrado exitosamente");
            //Redirección en el cliente hacia el método listarLibros()
            return "redirect:/libros/list";
        }
        else {
            //Sino se insertó regresamos al formulario de ingreso
            model.addAttribute("libro",libro);
            return "libros/nuevo";
        }
    }
}