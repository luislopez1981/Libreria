package model;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import javax.persistence.PersistenceException;
import javax.persistence.Query;

public class TemaDAO {

	private EntityManagerFactory emf;
	private EntityManager em;
	private EntityTransaction tx;
	private Tema tema;
	
	public TemaDAO(){
		emf = Persistence.createEntityManagerFactory("Libreria");
		em = emf.createEntityManager();
		tx = em.getTransaction();		
	}
	
	public int insertar (Tema tema){
		int filas = -1;
		
		tx.begin();
		try {
			em.persist(tema);
			filas = 1;
			tx.commit();
		} catch (PersistenceException e) {
			filas=-1;
			System.out.println("traza de insert tema");
			e.printStackTrace();
		}
		
		
		return filas;
	}
	
	public List<Tema> findAll(){
		List<Tema> listaTema= null;
		Query q1 = em.createNamedQuery("Tema.findAll",Tema.class);
		listaTema = (List<Tema>)q1.getResultList();
		return listaTema;
	}
	public Tema findById(Long clave){
		Tema tema= null;
		tx.begin();
		try {
			tema = em.find(Tema.class, clave);
		tx.commit();
		} catch (PersistenceException e) {
			tx.rollback();
			System.out.println("traza de find usuario");
			e.printStackTrace();
		}
		
		return tema;
	}
	
	public List<Libro> getListaLibro(Tema tema){
		List<Libro> listaLibro=null;
		Tema tema1 = tema;
		tx.begin();
		
		listaLibro = tema1.getLibros();
		tx.commit();
		
		return listaLibro;
		
	}
}
