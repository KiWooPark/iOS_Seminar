### DFS 알고리즘

```
깊이 우선 탐색이라고도 부르며, 그래프의 깊은 부분을 우선적으로 탐색하는 알고리즘이다.
특정한 경로로 탐색하다가 특정한 상황에서 최대한 깊숙이 들어가서 노드를 방문한 후, 다시 돌아가 다른 경로로 탐색하는 알고리즘
```

### BFS 알고리즘

```
너비 우선 탐색이라고도 부르며 가까운 노드부터 탐색하는 알고리즘이다.
DFS는 최대한 멀리있는 노드를 우선으로 탐색하는 방식으로 동작하지만 BFS는 그 반대로 동작한다.
BFS는 선입선출 방식인 큐 자료구조를 이용한다.
```

### 탐색, 자료구조,  스택,  큐,  재귀함수,  그래프에대해 간단하게 설명

#### 탐색

```
많은 양의 데이터 중에서 원하는 데이터를 찾는 과정으로
대표적인 탐색 알고리즘으로 DFS와 BFS가 있다.
```

#### 자료구조

```
데이터를 표현하고 관리하고 처리하기 위한 구조를 의미하며
대표적인 자료구조로 스택과 큐가 있다.

스택과 큐는 두가지 핵심적인 함수로 구성되어있는데
1. 삽입 - 데이터를 삽입한다.
2. 삭제 - 데이터를 삭제한다.

단, 실제로 스택과 큐를 사용할 때에는 삽입과 삭제 외에도 오버플로우와 언더플로우를 고민해야한다.
```

#### 오버플로우

```
특정한 자료구조가 수용할 수 있는 데이터의 크기를 이미 가득 찬 상태에서 삽입 연산을 수행할 때 발생한다.
즉, 저장공간을 벗어나 데이터가 넘쳐흐를 때 발생한다.
```

#### 언더플로우

```
반대로 특정 자료구조에 데이터가 전혀 들어있지 않은 상태에서 삭제 연산을 수행할 때 발생한다.
즉, 데이터가 없는 상태일 때 발생한다.
```

#### 스택

```
후입선출 구조로 쌓아 올린다는 것을 의미하며, 박스를 쌓아 올리는 것처럼 차곡차곡 쌓아 올린 형태의 자료구조를 말한다.
가장 마지막으로 들어온 자료를 TOP이라고 부르며, 삭제 연산을 수행하게 되면 가장 마지막에 들어온 자료(TOP)가 삭제된다.

스택에서 삽입은 PUSH, 삭제는 POP이라는 용어로 사용된다.

이때 비어있는 스택에 POP 연산을 수행하게 되면 스택 언더플로우가 발생하고
꽉 차있는 스택에 PUSH 연산을 수행하게 되면 스택 오버플로우가 발생한다.
```

#### 큐

```
선입선출 구조로 대기줄에 비유할 수 있으며, 흔히 놀이공원에 입장하기 위해 줄을 설 때, 먼저 온 사람이 먼저 들어가는 것과 같다.
큐는 스택과 달리 한쪽에서는 삽입 작업이, 다른 한쪽에서는 삭제 작업이 양쪽으로 이루어진다.

이때 삽입이 일어나는 곳을 리어(rear), 삭제 작업이 이루어지는 곳을 프론트(front)라고 말하며,
큐의 삽입 연산을 인큐(enqueue), 삭제 연산을 디큐(dequeue)라고 부른다.

즉, 가장 먼저 큐에 들어온 원소를 프론트라고 하고, 가장 마지막에 들어온 원소를 리어라고 한다.
```

#### 재귀함수

```swift
자기자신을 다시 호출하는 함수를 말한다.
즉, 내 함수 안에서 내 함수를 호출하는 형태

func recursiveFunc() {
    print("재귀 함수를 호출합니다.")
    recursiveFunc()
}

recursiveFunc()

위 코드를 실행하면 "재귀 함수를 호출합니다." 라는 문자열이 무한히 출력된다.

재귀 함수를 사용할 때에는 재귀 함수가 언제 끝날지 종료 조건을 꼭 명시해 주어야 한다.
※ 종료 조건을 명시해주지 않는다면 함수가 무한히 호출되므로 주의!

func recursiveFunc(i: Int) {
    if i == 100 {
        return
    }
    print("\(i) 번째 재귀 함수에서, \(i + 1) 번째 재귀 함수를 호출합니다.")
    recursiveFunc(i: i + 1)
    print("\(i) 번째 재귀 함수를 종료합니다.")   
}

recursiveFunc(i: 1)
```

#### 그래프

```
노드(정점)와 간선(브랜치)으로 이루어진 자료구조이다.

그래프의 탐색은 하나의 노드를 시작으로 다수의 노드를 방문하는 것을 말하며, 
두 노드가 간선으로 연결되어 있다면 두 노드는 인접하다고 표현한다.

간단하게 도시를 노드, 도로를 간선으로 이해하면 쉬움

그래프의 종류로는 4가지가 있다.
1. 방향 그래프
 -. 간선에 방향이 있는 그래프로 간선 그래프 방향으로만 갈 수 있다.
2. 무방향 그래프
 -. 간선에 방향이 없는 그래프로 노드는 양방향으로 갈 수 있다.
3. 가중치 그래프
 -. 노드를 이동할 때 드는 비용, 또는 가중치가 할당된 그래프
4. 완전 그래프
 -. 모든 노드가 간선으로 연결되어 있는 그래프
 
 
그래프를 표현하는 방식으로는 대표적으로 2가지가 있는데 코딩 테스트에서는 이 두 방식을 모두 필요하다.
1. 인접 행렬 - 2차원 배열로 그래프의 연결 관계를 표현하는 방식
2. 인접 리스트 - 리스트로 그래프의 연결 관계를 표현하는 방식
```

---

### 문제 풀이

#### 스택

```swift
var stack = [Int]()

// 5 2 3 7 POP 1 4 POP 수행
stack.append(5)
stack.append(2)
stack.append(3)
stack.append(7)
stack.popLast()
stack.append(1)
stack.append(4)
stack.popLast()

print(stack.map{$0}) // [5,2,3,1]
```

#### 큐

```swift
var queue = [Int]()

// 5 2 3 7 POP 1 4 POP 수행
queue.append(5)
queue.append(2)
queue.append(3)
queue.append(7)
queue.removeFirst()
queue.append(1)
queue.append(4)
queue.removeFirst()

print(queue.map({$0})) // [3,7,1,4]
```

#### 재귀함수

```swift
// 반복적으로 구현
func iterativeFunc(num: Int) -> Int {
    var result = 1
    
    // 2~5까지 반복
    for n in 2...num {
        // result변수에 result * n의 결과값을 넣어줌
        result *= n
    }
    
    // result 출력
    return result
}

// 재귀적으로 구현
func recursiveFunc(num: Int) -> Int {

    // num이 1보다 작거나 같을경우 1을 반환하고 함수 종료
    if num <= 1 {
        return 1
    }
    
    // 4, 3, 2 ,1 순으로 재귀함수 호출
    return (num * recursiveFunc(num: num - 1))
}

print(iterativeFunc(num: 5)) // 120
print(recursiveFunc(num: 5)) // 120
```

#### DFS

```swift
let graph = [
    [],
    [2,3,8],
    [1,7],
    [1,4],
    [3,5],
    [3,4],
    [7],
    [2,6,8],
    [1,7]
]

// 방문 체크 배열 생성
var visited = Array(repeating: false, count: graph.count)

func dfs(node: Int) {
    
    // 현재 노드 방문 처리
    visited[node] = true
    print("node = \(node)")

    // 그래프 2차원 배열의 해당 인덱스의 요소 수만큼 반복
    for i in graph[node] {
        // 방문하지 않은 인덱스라면 dfs함수 호출
        if visited[i] == false {
            dfs(node: i)
        }
    }
}

dfs(node: 1)

// 1 2 7 6 8 3 4 5
```

#### BFS

```swift
let graph = [
    [],
    [2,3,8],
    [1,7],
    [1,4,5],
    [3,5],
    [3,4],
    [7],
    [2,6,8],
    [1,7]
]

// 방문 체크 배열 생성
var visited = Array(repeating: false, count: graph.count)
// 큐로 사용할 정수 배열 생성
var queue = [Int]()

func bfs(node: Int) {

    // 현재노드 방문처리
    visited[node] = true

    // 현재노드 큐에 추가
    queue.append(node)

    // 큐가 빌때까지 반복
    while !queue.isEmpty {
        
        // 먼저 들어온 노드 꺼냄
        let front = queue.removeFirst()
        print("노드 = ",front)
        
        // 꺼낸 노드를 기준으로 인접 노드 방문처리 및 큐에 삽입
        for i in graph[front] {
            if visited[i] == false {
                queue.append(i)
                visited[i] = true
            }
        }
    }
}

bfs(node: 1)

// 1 2 3 8 7 4 5 6
```

#### 음료수 얼려먹기

```swift
let n = 15
let m = 14

var graph = [
    [0,0,0,0,0,1,1,1,1,0,0,0,0,0],
    [1,1,1,1,1,1,0,1,1,1,1,1,1,0],
    [1,1,0,1,1,1,0,1,1,0,1,1,1,0],
    [1,1,0,1,1,1,0,1,1,0,0,0,0,0],
    [1,1,0,1,1,1,1,1,1,1,1,1,1,1],
    [1,1,0,1,1,1,1,1,1,1,1,1,0,0],
    [1,1,0,0,0,0,0,0,0,1,1,1,1,1],
    [0,1,1,1,1,1,1,1,1,1,1,1,1,1],
    [0,0,0,0,0,0,0,0,0,1,1,1,1,1],
    [0,1,1,1,1,1,1,1,1,1,1,0,0,0],
    [0,0,0,1,1,1,1,1,1,1,1,0,0,0],
    [0,0,0,0,0,0,0,1,1,1,1,0,0,0],
    [1,1,1,1,1,1,1,1,1,1,0,0,1,1],
    [1,1,1,0,0,0,1,1,1,1,1,1,1,1],
    [1,1,1,0,0,0,1,1,1,1,1,1,1,1]
]

var result = 0

func dfs(x: Int, y: Int) -> Bool {
    
    // 이동한 좌표가 n x m 범위안에 있는지 체크
    if x <= -1 || x >= n || y <= -1 || y >= m {
        return false
    }
    
    // 현재 위치가 방문하지 않았다면
    if graph[x][y] == 0 {
        
        // 방문 처리
        graph[x][y] = 1

        //상
        dfs(x: x-1, y: y)
        //하
        dfs(x: x+1, y: y)
        //좌
        dfs(x: x, y: y-1)
        //우
        dfs(x: x, y: y+1)

        return true
    }
    return false
    
}

// 0부터 n보다 작을때까지 반복
for i in 0..<n {
    // 0부터 m보다 작을때까지 반복
    for j in 0..<m {
        // dfs함수의 반환값이 true라면 result 1씩 증가
        if dfs(x: i, y: j) {
            result += 1
        }
    }
}

print(result) // 8
```

#### 미로탈출

```swift
let n = 5
let m = 6

var graph = [
    [1,0,1,0,1,0],
    [1,1,1,1,1,1],
    [0,0,0,0,0,1],
    [1,1,1,1,1,1],
    [1,1,1,1,1,1]
]

var queue = [[Int]]()

// 상하좌우 이동 좌표
var step = [[-1,0],[1,0],[0,-1],[0,1]]

func dsf(x: Int, y: Int) -> Int {
    
    // 현재 위치 큐에 삽입
    queue.append([x,y])
    
    // 큐가 빌때까지 반복
    while !queue.isEmpty {
        
        // 먼저 삽입된 노드 꺼냄
        let front = queue.removeFirst()
        
        // 큐에서 꺼낸 좌표값을 x와 y로 초기화
        let x = front[0]
        let y = front[1]
        
        // 상,하,좌,우 4번 반복
        for i in 0..<4 {
            
            // 상,하,좌,우 이동할 방향의 좌표를 계산해서 초기화
            let moveX = front[0] + step[i][0]
            let moveY = front[1] + step[i][1]

            // n x m 범위를 벗어나면 다음방향
            if moveX < 0 || moveX >= n || moveY < 0 || moveY >= m {
                continue
            }
            
            // 괴물이 있는 부분이면 다음 방향
            if graph[moveX][moveY] == 0 {
                continue
            }
            
            // 괴물이 없는 부분이면
            if graph[moveX][moveY] == 1 {
                // 현재 위치에 이전 위치값 + 1
                graph[moveX][moveY] = graph[x][y] + 1
                // 현재 위치 좌표 큐에 삽입
                queue.append([moveX,moveY])
            }
        }
    }
    // 마지막 출구에 도착했을때 카운트 반환
    return graph[n-1][m-1]
}

print(dsf(x: 0, y: 0)) // 10
```

#### 프로그래머스 - 타겟 넘버 

```swift
// 전역변수로 numbers와 target을 복사하기 위한 변수 초기화 (dfs함수에서 사용하기 위함)
var numbersCP = [Int]()
var targetCP = 0
var result = 0

func solution(_ numbers:[Int], _ target:Int) -> Int {
    // numbers 복사
    numbersCP = numbers
    // target 복사
    targetCP = target 
    
    // dfs 함수 호출
    dfs(0,0)
    
    return result
}


func dfs(_ sum: Int, _ depth: Int) { 
    
    // depth가 numbers배열의 총 갯수와 같다면 
    if depth == numbersCP.count {
    
        // sum값이 target값과 같다면  
        if sum == targetCP {
            // result 1 증가
            result += 1
        }
        return 
    }
    
    // + 계산을 위해 dfs 함수 호출
    dfs(sum + numbersCP[depth], depth + 1)
    // - 계산을 위해 dfs 함수 호출 
    dfs(sum - numbersCP[depth], depth + 1)
    
}
```

*****

### 정렬
```
데이터를 특정하 기준에 따라서 순서대로 나열하는것으로 이진 탐색으 전처리 과정이기도 하다.
```

### 선택 정렬 
```
선택 정렬은 배열에서 가장 작은 데이터를 선택하여 앞으로 내보내는 정렬 알고리즘이다.
가장 원시적이 방법으로 아래 과정을 반복하면 전체 데이터의 정렬이 이루어진다.

과정
1. 주어진 리스트 중에 최소값을 찾는다.
2. 그 값을 맨 앞에 위치한 값과 교체한다.
3. 맨처음 위치를 뺀 나머지 리스트를 같은 방법으로 교체한다.
```

### 삽입 정렬
```
삽입 정렬은 필요할때마다 각 데이터를 적절한 위치에 삽입하는 정렬 알고리즘이다.
특정한 데이터가 적절한 위치에 들어가기 이전에, 그 앞까지의 데이터는 정렬되어 있다고 가정한다.
아래 과정을 반복하면 전체 데이터의 정렬이 이루어 진다.

1. 현재 선택된 데이터와 이전 위치에 있는 데이터들을 비교한다. (맨처음 시작하는 데이터는 두번째 데이터부터 시작)
2. 선택된 데이터가 이전 위치에 있던 데이터보다 작다면 위치를 서로 교환한다.
3. 다음 데이터를 1번 과정부터 반복한다.
```

### 퀵 정렬
```
퀵 정렬은 기준을 설정 한 다음 큰 수와 작은 수를 교환 한 후 배열을 반으로 나누는 방식으로 동작하는 정렬 알고리즘이다.
퀵 정렬에서는 큰 숫자와 작은 숫자를 교환할 때 기준이 필요한데 그 기준을 피벗이라고 한다.
※ 일반적으로 첫번째 데이터를 피벗으로 지정한다.
아래 과정을 반복하면 전체 데이터의 정렬이 이루어진다.

과정
1. 리스트 안에 있는 한 요소를 선택한다. (이를 피벗이라고 한다.)
2. 피벗을 기준으로 오른쪽은 피벗보다 큰 데이터, 왼쪽은 피벗보다 작은 데이터를 검색한 후 위치를 서로 교환한다.
3. 위치 교환중 오른쪽 피벗과 왼쪽 피벗이 엇갈릴 경우 작은 데이터와 피벗의 위치를 교환한다.
4. 피벗을 제외한 왼쪽 배열과 오른쪽 배열을 다시 정렬한다. (2번부터 다시 반복) 
5. 왼쪽, 오른쪽 배열을 더이상 분할이 불가능 할 때까지 반복한다.
```

### 계수 정렬
```
데이터들을 서로 비교하지 않고 정렬하는 알고리즘이다.
특정한 조건이 부합할 때만 사용할수 있는 알고리즘으로 그 조건중 하나는 데이터의 크기 범위가 제한되어 정수 형태로 표현할 수 있을 때만 사용 가능하다.
아래 과정을 반복하면 전체 데이터의 정렬이 이루어진다.

과정 
1. 가장 큰 데이터와 가장 작은 데이터를 찾아 해당 범위의 데이터가 모두 담길 수 있도록 하나의 배열을 생성하고 0으로 초기화한다.
2. 데이터를 하나씩 확인하며 데이터의 값과 동일한 인덱스의 데이터를 1씩 증가시킨다.
3. 2번 과정을 반복한다. 
```

***** 

### 문제 풀이

#### 선택정렬

```swift
var arr = [7,5,9,0,3,1,6,2,4,8]

for i in 0..<arr.count {
	// 가장 작은 수의 인덱스 
    let minIndex = arr.firstIndex(of: i)!
    
    // 맨 처음 인덱스부터 + 1 씩 이동하며 작은 수 교환
    let temp = arr[i]
    arr[i] = arr[minIndex]
    arr[minIndex] = temp
}
```

#### 삽입 정렬
```swift
var arr = [7,5,9,0,3,1,6,2,4,8]
// 정렬된 인덱스 카운트 
var leftArrCount = 1

for i in 1..<arr.count {
	// 교환할 데이터
    let target = arr[i]
    
    // 0부터 정렬된 배열까지 반복
    for j in 0..<leftArrCount {
       
       	// 교환할 데이터가 정렬되어있는 데이터보다 클 경우 
        if target > arr[j] {
            continue

          // 교환할 데이터가 정렬되어 있는 데이터보다 작을 경우
        } else if target < arr[j] { 

        	// 교환할 데이터 삭제
            arr.remove(at: i)
            // 정렬되어 있는 데이터 뒤에 삽입
            arr.insert(target, at: j )
            break
        }
    }
    // 정렬된 데이터 카운트 증가
    leftArrCount += 1
}
```
#### 퀵 정렬
```swift
var arr = [5,7,9,0,3,1,6,2,4,8]

func sort(_ arr: [Int]) -> [Int] {
    
    // 배열이 0이거나 1이면 정렬이 끝났으므로 정렬된 데이터 반환
    if arr.count < 2 {
        return arr
    } else {

    	// 배열의 첫번째 데이터 피벗으로
        let pivot = arr.first
        // 피벗보다 작은 데이터 
        let left = arr.filter({$0 < pivot ?? 0})
        // 피벗보다 큰 데이터
        let right = arr.filter({$0 > pivot ?? 0})

        // 작은 데이터배열 + 피벗 + 큰 데이터 배열 
        let result = sort(left) + [pivot ?? 0] + sort(right)
        
        return result
    }
}

print(sort(arr))
```
#### 계수 정렬
```swift
var arr = [7,5,9,0,3,1,6,2,9,1,4,8,0,5,2]

// 데이터중 제일 큰 값 
let max = arr.max()!
// 제일 큰 데이터 + 1 크기 만큼의 배열을 만들고 0으로 초기화
var newArr = Array(repeating: 0, count: max + 1)
var result = ""

// 데이터의 값이 0으로 초기화된 배열의 인덱스와 같을 때 카운트 1씩 증가 
for i in 0..<arr.count {
    let index = arr[i]
    newArr[index] += 1
}

// 각각의 배열의 카운트 값만큼 인덱스 값 출력
for i in 0..<newArr.count {
    for _ in 0..<newArr[i] {
        result += "\(i) "
    }
}
```
#### 위에서 아래로
```swift
// input 
let n = 3
var arr = [15,27,12]
// 정렬 완료된 배열 카운트
var leftArrCount = 1

for i in 1..<n {
    // 교환할 데이터 
    let target = arr[i]
    
    // 0부터 정렬된 배열까지 반복
    for j in 0..<leftArrCount {
    	// 교환할 데이터가 정렬되어 있는 데이터보다 작다면 다음 반복 진행
        if target < arr[j] {
            continue
          // 교환할 데이터가 정렬되어 있는 데이터보다 크다면 
        } else if target > arr[j] {
        	// 교환할 데이터 삭제
            arr.remove(at: i)
            // 교환할 데이터를 정렬되어 있는 데이터 뒤에 삽입
            arr.insert(target, at: j)
            break
        }
    }

    // 정렬된 배열 카운트 증가
    leftArrCount += 1
}
```
#### 성적이 낮은 순서로 출력하기
```swift
// input
let n = 2
var input = [["홍길동", "95"], ["이순신","77"]]
// (String, Int)타입 튜블 배열 선언
var arr = [(String,Int)]()
// 정렬 완료된 배열 카운트
var leftArrCount = 1

// (String, Int)타입 튜블 배열로 새로운 데이터를 만들고 arr 배열에 추가
for i in 0..<input.count {
    let data = (input[i][0], Int(input[i][1])!)
    arr.append(data)
}

for i in 1..<n {
	// 교환할 데이터 
    let target = arr[i]
    
    // 0부터 정렬된 배열까지 반복
    for j in 0..<leftArrCount {

    	// 교환할 점수가 정렬되어있는 점수보다 크다면 다음 반복
        if target.1 > arr[j].1 {
            continue
          // 교환할 점수가 정렬되어 있는 점수보다 작다면 
        } else if target.1 < arr[j].1 {
        	// 해당 점수 데이터 삭제
            arr.remove(at: i)
            // 정렬되어 있는 점수 뒤로 삽입
            arr.insert(target, at: j)
            break
        }
    }

    // 정렬 데이터 카운트 증가
    leftArrCount += 1
}
```
#### 두 배열의 원소 교체
```swift
// input
let inputA = [1,2,5,4,3]
let inputB = [5,5,6,6,5]
let n = 5
let k = 3

// a배열 오름차순 정렬
var aArr = inputA.sorted()

// b배열 내림차순 정렬
var bArr = inputB.sorted().reversed().map({$0})

// k번 만큼 반복
for i in 0..<k {
	// a 배열의 데이터값이 b 배열의 데이터값보다 작을때 
    if aArr[i] < bArr[i] {
    	// a, b 배열의 데이터 교환
        let temp = aArr[i]
        aArr[i] = bArr[i]
        bArr[i] = temp
    } else {
        break
    }
}
```
#### 가장 큰 수
```swift
// [6, 10, 2]	
// [3, 30, 34, 5, 9]
func solution(_ numbers:[Int]) -> String {
    
    var result = numbers.sorted() { (left, right)  in
    	// 610 > 106 이런식으로 내림차순 정렬 되도록
        let a = Int(String(left) + String(right))
        let b = Int(String(right) + String(left))
        return a! > b!
    }
    
    // 배열이 [0,0,0,0]일때 0000으로 결과가 나오므로 0으로 다시 초기화
    if result.first == 0 {
        result = [0]
    }
    
    // result 문자들을 다 더해서 하나의 문자열로 합침
    return result.map{String($0)}.joined()
}

print(solution([6,10,2]))
print(solution([0,0,0,0]))
```
#### H-Index
```swift
// [3, 0, 6, 1, 5]
func solution(_ citations:[Int]) -> Int {
    
    // 인용횟수를 내림차순 정렬
    let sortedCitaions = citations.sorted(by: >)
    var result = 0

    // 인용횟수 배열의 크기만큼 반복
    for i in 0..<sortedCitaions.count {
    	// 현재 인덱스값보다 인용횟수가 클때만 카운트 증가
        if i < sortedCitaions[i] {
            result += 1
        }
    }
    
    return result
}
```

