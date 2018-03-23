package model;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import javax.persistence.PersistenceException;
import javax.persistence.Query;


public class LibroDAO {
	private EntityManagerFactory emf;
	private EntityManager em;
	private EntityTransaction tx;
	Libro libro = null;
	
	public LibroDAO(){
		
		emf = Persistence.createEntityManagerFactory("Libreria");
		em = emf.createEntityManager();
		tx = em.getTransaction();	
	}
	
	public int insertar (Libro	libro){
		int filas = -1;
		
		tx.begin();
		try {
			em.persist(libro);
			filas = 1;
			tx.commit();
		} catch (PersistenceException e) {
			filas=-1;
			System.out.println("traza de insert libro");
			e.printStackTrace();
		}	
		
		return filas;
	}
	
	public List<Libro> findByTema (Tema tema){
		List<Libro> listaLibro=null;
		
		tx.begin();
		//String sql = "select l from Libro l	 where l.tema=?1";
		String sql = "select l from Libro l";
		Query q1 = em.createQuery(sql,Libro.class);
		//q1.setParameter(1, tema);
		listaLibro = (List<Libro>)q1.getResultList();
		tx.commit();
		
		return listaLibro;		
		
		}
	public Libro findById(String clave){
		Libro libro= null;
		tx.begin();
		try {
			libro = em.find(Libro.class, clave);
		tx.commit();
		} catch (PersistenceException e) {
			tx.rollback();
			System.out.println("traza de find libro");
			e.printStackTrace();
		}
		
		return libro;

}
}
