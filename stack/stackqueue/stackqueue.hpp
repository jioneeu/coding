#pragma once 

#include "../array/stack.hpp"

template <class T>
class StackQueue
{
  private:
    Stack<T> stackA;
    Stack<T> stackB;
    int capacity;
    int nElems;

  public:
    StackQueue(int size):stackA(size), stackB(size), capacity(size), nElems(0) {}
    ~StackQueue() = default;

    void enqueue(T val);
    void dequeue();
    bool empty();
    T peek();
};

template <class T> 
void StackQueue<T>::enqueue(T val) 
{
  if (nElems == capacity) 
  {
    cout << "overflowed..." << endl;
    return;
  }
  stackA.push(val);
  ++nElems;
}

template <class T> 
void StackQueue<T>::dequeue()
{
  if (nElems == -1) 
  {
    cout << "underflowed.." << endl;
    return;
  }
  if(stackB.empty())
  {
    while(!stackA.empty())
    {
      stackB.push(stackA.peek());
      stackA.pop();
    }
  }
  stackB.pop();
  --nElems;
}

template <class T> 
bool StackQueue<T>::empty() 
{
  return nElems == 0;
}

template <class T> 
T StackQueue<T>::peek() 
{
  if(nElems == 0) 
  {
    cout << "Queue is empty...";
    return -1;
  }

  if(stackB.empty())
  {
    while(!stackA.empty())
    {
      stackB.push(stackA.peek());
      stackA.pop();
    }
  }

  return stackB.peek();
}
