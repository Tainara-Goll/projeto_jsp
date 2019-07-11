package beans;

public class Produto {

	
	//Atributos
	private int idProduto;
	private String nomeProduto;
	private double valorproduto;
	
	//GET E SET
	public int getIdProduto() {
		return idProduto;
	}
	public void setIdProduto(int idProduto) {
		this.idProduto = idProduto;
	}
	public String getNomeProduto() {
		return nomeProduto;
	}
	public void setNomeProduto(String nomeProduto) {
		this.nomeProduto = nomeProduto;
	}
	public double getValorproduto() {
		return valorproduto;
	}
	public void setValorproduto(double valorproduto) {
		this.valorproduto = valorproduto;
	}
}
