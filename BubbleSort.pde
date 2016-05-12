int[] i=new int[100];      //ソート前の配列
int[] a=new int[i.length]; //ソートする配列
int pointer;               //入れ替えを行う箇所
int counter;               //入れ替えを行った回数

void setup() {
  size(1000, 500);
  frameRate(120);
  pointer=a.length-2;
  counter=0;
  ArrayList<Integer> list=new ArrayList<Integer>();
  for (int j=0; j<i.length; j++) {
    list.add(j+1);
  }
  for (int j=0; j<i.length; j++) {
    int r=(int)random(list.size());
    i[j]=list.get(r);
    list.remove(r);
    a[j]=i[j];
  }
  noStroke();
}
void draw() {
  background(255);
  for (int j=0; j<i.length; j++) {
    fill(0);
    rect(j*5, height, 5, -5*i[j]);
  }
  if (pointer>=0)
    bubbleSort();
  for (int j=0; j<i.length; j++) {
    if (j==pointer || j==pointer+1 || pointer==-1)
      fill(255, 0, 0);
    else
      fill(0);
    rect(j*5+width/2, height, 5, -5*a[j]);
  }
}
void mousePressed() {
  setup();
}
void bubbleSort() {
  if (a[pointer]>a[pointer+1]) {//データの入れ替え
    int temp=a[pointer];
    a[pointer]=a[pointer+1];
    a[pointer+1]=temp;
  }
  if (pointer==counter) {
    if (pointer==a.length-2) {
      pointer=-1;
    } else {
      pointer=a.length-2;
      counter++;
    }
  } else {
    pointer--;
  }
}