package model;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import javax.persistence.PersistenceException;
import javax.persistence.Query;

public class PedidoDAO {

	private EntityManagerFactory emf;
	private EntityManager em;
	private EntityTransaction tx;
	
	
public PedidoDAO(){
		
		emf = Persistence.createEntityManagerFactory("Libreria");
		em = emf.createEntityManager();
		tx = em.getTransaction();	
	}

public int insertar (Pedido	pedido){
	int filas = -1;
	
	tx.begin();
	try {
		em.persist(pedido);
		filas = 1;
		tx.commit();
	} catch (PersistenceException e) {
		filas=-1;
		System.out.println("traza de insert pedido");
		e.printStackTrace();
	}	
	
	return filas;
}

	public List<Pedido> findByDate (Date date){
		List<Pedido> listaPedido = null;
		tx.begin();
		String sql = "select p from Pedido p where p.fechaAlta=?1";
		Query q1 = em.createQuery(sql,Pedido.class);
		q1.setParameter(1, date);
		listaPedido = (List<Pedido>)q1.getResultList();
		tx.commit();
		return listaPedido;
		
	}
	
	public List<Pedido> findbyUser (Usuario usuario){
		List<Pedido> listaPedido = null;
		
		tx.begin();
		String sql = "select p from Pedido p where p.usuario=?1";
		Query q1 = em.createQuery(sql,Pedido.class);
		q1.setParameter(1, usuario);
		listaPedido = (List<Pedido>)q1.getResultList();
		tx.commit();
		return listaPedido;		
	}
	
	public Object[] estadisticaCliente (Usuario usuario){
		Object[] estadistica = null;
		
		tx.begin();
		String sql= "select count(*), count(distinct libros.ID_TEMA), sum(linea_pedidos.CANTIDAD*linea_pedidos.PRECIO_VENTA) "
				+ "from pedidos join linea_pedidos "
				+ "on pedidos.id_pedido=linea_pedidos.id_pedido join libros "
				+ "on linea_pedidos.isbn = libros.isbn "
				+ "where pedidos.id_usuario=?";
		Query q1 = em.createNativeQuery(sql);
		q1.setParameter(1, usuario.getIdUsuario());
		estadistica = (Object[]) q1.getSingleResult();
		tx.commit();
		return estadistica;
		
	}
}
