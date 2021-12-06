//I worked alone on this homework assignment, using only course materials
/**
* @author Azha Qari
* @version 1.0
* A typed Node
* @param <T> the type param
*/

public class Node<T> {
    private Node<T> next;
    private T data;

    /**
    * Constructor that creates a new Node.
    * @param d the data
    * @param n next
    */
    public Node(T d, Node<T> n) {
        data = d;
        next = n;
    }
    /**
    * Constructor that creates a new Node.
    * @param d the data
    */
    public Node(T d) {
        this(d, null);
    }
    /**
    * Getter for data.
    * @return the data
    */
    public T getData() {
        return data;
    }
    /**
    * Setter for next.
    * @param n the next
    */
    public void setNext(Node<T> n) {
        next = n;
    }
    /**
    * Getter for next.
    * @return the next
    */
    public Node<T> getNext() {
        return next;
    }

}
