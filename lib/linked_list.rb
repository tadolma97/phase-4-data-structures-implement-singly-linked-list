require_relative './node'

class LinkedList
    attr_accessor :head
    def initialize
        @head=nil
    end

    def prepend(node)  
        node.next_node=head
        self.head = node    
    end

    def append(node)
        if head.nil?
            return prepend(node)
        end
        last_node=head
        while last_node.next_node
            last_node=last_node.next_node
        end
        last_node.next_node=node
    end

    def delete_head
        if head.nil?
            return 
        end
        self.head=self.head.next_node 
    end

    def delete_tail
        if head.nil?
            return 
        end
        if head.next_node.nil?
            return delete_head
        end
        target=head 
        prev=nil 
        while target.next_node
            prev=target 
            target=target.next_node

        end
        prev.next_node=nil 

    end

    def add_after(index, node)
        return prepend(node) if index==0
        counter=0
        target=head 
        while counter<index 
            counter+=1
            target=target.next_node
        end
        if target 
            node.next_node=target.next_node
            target.next_node=node 
        else 
            append(node)
        end
    end

    def search(value)
        target=head
        while target 
            return target if target.data==value
            target=target.next_node
        end
        nil
    end



end
