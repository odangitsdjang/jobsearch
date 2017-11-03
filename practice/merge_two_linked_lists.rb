def merge_two_lists(l1,l2) 
  current = ListNode.new(100)
  root = current
  current1 = l1
  current2 = l2
  
  while current1 && current2
    if current1.val > current2.val
      current.next = ListNode.new(current2.val)
      current2 = current2.next
    else 
      current.next = ListNode.new(current1.val)
      current1 = current1.next
    end
    current = current.next
  end
  not_empty = current1 ? current1 : current2
  current.next = not_empty
  root.next
end