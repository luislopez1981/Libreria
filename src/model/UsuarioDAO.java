package model;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import javax.persistence.PersistenceException;

public class UsuarioDAO {

	
	private EntityManagerFactory emf;
	private EntityManager em;
	private EntityTransaction tx;
	//private String sql;
	private Usuario usuario;
	
	public UsuarioDAO(){
		emf = Persistence.createEntityManagerFactory("Libreria");
		em = emf.createEntityManager();
		tx = em.getTransaction();
		
	}
	
	public Usuario findById(String clave){
		tx.begin();
		try {
			usuario = em.find(Usuario.class, clave);
		tx.commit();
		} catch (PersistenceException e) {
			tx.rollback();
			System.out.println("traza de find usuario");
			e.printStackTrace();
		}
		
		return usuario;
	}
	
	public int insertar(Usuario usuario) {
		int filas = -1;
		tx.begin();
		try {
			em.persist(usuario);
			filas = 1;
		tx.commit();
		} catch (PersistenceException e) {
			
			System.out.println("traza de insert usuario");
			e.printStackTrace();
		}
		return filas;
	}
}
