// Given a linked list, remove the nth node from the end of list and
// return its head.

// For example,

// Given linked list: 1 - > 2 - > 3 - > 4 - > 5, and n = 2.

// After removing the second node from the end, the linked list becomes 1 - > 2 - > 3 - > 5.
// Note:
//   Given n will always be valid.
// Try to do this in one pass.

function removeNthFromEnd(head, n) {
  let current = head;
  let previous = head;
  let ahead = head;
  let count = 0;
  while (count < n && ahead) {
    ahead = ahead.next;
    count++;
  }
  while (ahead) {
    ahead = ahead.next;
    previous = current;
    current = current.next
  }
  if (previous == current) {
    return head.next
  } else if (!head) {
    return null;
  } else {
    previous.next = current.next;
    return head;
  }

  return head;
};