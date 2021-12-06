import java.util.NoSuchElementException;

/**
 * Your implementation of a CircularSinglyLinkedList without a tail pointer.
 *
 * @author Azha Qari
 * @version 1.0
 * @userid aqari3
 * @GTID 903481053
 *
 * Collaborators: I worked on this hw alone
 *
 * Resources: course materials and stackoverflow
 */
public class CircularSinglyLinkedList<T> {


    // Do not add new instance variables or modify existing ones.
    private CircularSinglyLinkedListNode<T> head;
    private int size;

    // Do not add a constructor.

    /**
     * Adds the data to the specified index.
     *
     * Must be O(1) for indices 0 and size and O(n) for all other cases.
     *
     * @param index the index at which to add the new data
     * @param data  the data to add at the specified index
     * @throws java.lang.IndexOutOfBoundsException if index < 0 or index > size
     * @throws java.lang.IllegalArgumentException  if data is null
     */
    public void addAtIndex(int index, T data) {
        if (data == null) {
            throw new IllegalArgumentException("ERROR: the provided data is null");
        }
        if (index < 0 || index > size) {
            throw new IndexOutOfBoundsException("ERROR: index is not within"
                    + " the possible bounds");
        }

        CircularSinglyLinkedListNode<T> newNode = new CircularSinglyLinkedListNode<>(data);
        CircularSinglyLinkedListNode<T> current = head;

        if (head == null) {
            head = newNode;
            head.setNext(head);
            size++;
        } else if (index == size) {
            for (int i = 0; i < index - 1; i++) {
                current = current.getNext();
            }
            current.setNext(newNode);
            newNode.setNext(head);
            size++;
        } else if (index == 0) {
            addToFront(data);
        } else {
            for (int i = 0; i + 1 < index; i++) {
                current = current.getNext();
            }
            newNode.setNext(current.getNext());
            current.setNext(newNode);
            size++;
        }
    }

    /**
     * Adds the data to the front of the list.
     *
     * Must be O(1).
     *
     * @param data the data to add to the front of the list
     * @throws java.lang.IllegalArgumentException if data is null
     */
    public void addToFront(T data) {
        if (data == null) {
            throw new IllegalArgumentException("ERROR: the provided data is null");
        }
        CircularSinglyLinkedListNode<T> newNode = new CircularSinglyLinkedListNode<>(data);
        CircularSinglyLinkedListNode<T> current = head;

        newNode.setNext(current.getNext());
        newNode.setData(current.getData());

        head.setNext(newNode);
        head.setData(data);

        size++;
    }

    /**
     * Adds the data to the back of the list.
     *
     * Must be O(1).
     *
     * @param data the data to add to the back of the list
     * @throws java.lang.IllegalArgumentException if data is null
     */
    public void addToBack(T data) {
        if (data == null) {
            throw new IllegalArgumentException("ERROR: the provided data is null");
        }
        addAtIndex(size, data);
    }

    /**
     * Removes and returns the data at the specified index.
     *
     * Must be O(1) for index 0 and O(n) for all other cases.
     *
     * @param index the index of the data to remove
     * @return the data formerly located at the specified index
     * @throws java.lang.IndexOutOfBoundsException if index < 0 or index >= size
     */
    public T removeAtIndex(int index) {
        if (index < 0 || index >= size) {
            throw new IndexOutOfBoundsException("ERROR: index is not within"
                    + " the possible bounds");
        }

        CircularSinglyLinkedListNode<T> current = head;
        T returnData;

        if (index == 0) {
            returnData = (T) head.getData();
            head.setData(head.getNext().getData());
            head.setNext(current.getNext().getNext());
        } else if (index != size - 1) {
            for (int i = 0; i < index - 1; i++) {
                current = head.getNext();
            }
            returnData = (T) current.getNext().getData();
            current.setNext(current.getNext().getNext());

        } else {
            for (int i = 0; i < size - 2; i++) {
                current = current.getNext();
            }
            returnData = (T) current.getNext().getData();
            current.setNext(head);
        }
        size--;
        return returnData;
    }

    /**
     * Removes and returns the first data of the list.
     *
     * Must be O(1).
     *
     * @return the data formerly located at the front of the list
     * @throws java.util.NoSuchElementException if the list is empty
     */
    public T removeFromFront() {
        if (size == 0) {
            throw new java.util.NoSuchElementException("The list is empty");
        }
        T returnData = (T) head.getData();
        if (size == 1) {
            head = null;
        } else {
            returnData = removeAtIndex(0);
        }
        return returnData;
    }

    /**
     * Removes and returns the last data of the list.
     *
     * Must be O(n).
     *
     * @return the data formerly located at the back of the list
     * @throws java.util.NoSuchElementException if the list is empty
     */
    public T removeFromBack() {
        if (size == 0) {
            throw new java.util.NoSuchElementException("The list is empty");
        }
        return removeAtIndex(size - 1);
    }

    /**
     * Returns the data at the specified index.
     *
     * Should be O(1) for index 0 and O(n) for all other cases.
     *
     * @param index the index of the data to get
     * @return the data stored at the index in the list
     * @throws java.lang.IndexOutOfBoundsException if index < 0 or index >= size
     */
    public T get(int index) {
        if (index < 0 || index >= size) {
            throw new IndexOutOfBoundsException("ERROR: index is not within"
                    + " the possible bounds");
        }

        CircularSinglyLinkedListNode<T> current = head;
        T returnData;

        if (index == 0) {
            returnData = (T) head.getData();
        } else if (index != size - 1) {
            for (int i = 0; i < index - 1; i++) {
                current = current.getNext();
            }
            returnData = (T) current.getNext().getData();

        } else {
            for (int i = 0; i < size - 2; i++) {
                current = current.getNext();
            }
            returnData = (T) current.getNext().getData();
        }
        return returnData;
    }

    /**
     * Returns whether or not the list is empty.
     *
     * Must be O(1).
     *
     * @return true if empty, false otherwise
     */
    public boolean isEmpty() {
        return head == null;
    }

    /**
     * Clears the list.
     *
     * Clears all data and resets the size.
     *
     * Must be O(1).
     */
    public void clear() {
        head = null;
        size = 0;
    }

    /**
     * Removes and returns the last copy of the given data from the list.
     *
     * Do not return the same data that was passed in. Return the data that
     * was stored in the list.
     *
     * Must be O(n).
     *
     * @param data the data to be removed from the list
     * @return the data that was removed
     * @throws java.lang.IllegalArgumentException if data is null
     * @throws java.util.NoSuchElementException   if data is not found
     */
    public T removeLastOccurrence(T data) {
        if (data == null) {
            throw new IllegalArgumentException("The data entered is null");
        }
        if (size == 0) {
            return null;
        } else {
            CircularSinglyLinkedListNode<T> returnData = head;
            CircularSinglyLinkedListNode<T> current = head;

            if (head.getData().equals(data)) {
                removeAtIndex(0);
            } else {
                current.getNext();
                for (int i = 0; i < size - 1; i++) {
                    if (current.getNext().getData().equals(data)) {
                        returnData = current;
                    } else {
                        throw new NoSuchElementException("Data not found");
                    }

                }
            }

            return returnData.getData();
        }
    }

    /**
     * Returns an array representation of the linked list.
     *
     * Must be O(n) for all cases.
     *
     * @return the array of length size holding all of the data (not the
     * nodes) in the list in the same order
     */
    public T[] toArray() {
        T[] arr = (T[]) new Object[size];
        CircularSinglyLinkedListNode<T> node = head;

        int i = 0;
        while (i < size) {
            arr[i] = node.getData();
            node = node.getNext();
            i++;
        }
        return arr;
    }

    /**
     * Returns the head node of the list.
     *
     * For grading purposes only. You shouldn't need to use this method since
     * you have direct access to the variable.
     *
     * @return the node at the head of the list
     */
    public CircularSinglyLinkedListNode<T> getHead() {
        // DO NOT MODIFY!
        return head;
    }

    /**
     * Returns the size of the list.
     *
     * For grading purposes only. You shouldn't need to use this method since
     * you have direct access to the variable.
     *
     * @return the size of the list
     */
    public int size() {
        // DO NOT MODIFY!
        return size;
    }
}
