# 				lambda

## 1.什么是lambda？

### 	一个可传递的代码块，可以在以后执行一次或多次

## 2.为什么要用lambda

### 		

```
package ioAndStream;

import java.awt.Event;
import java.awt.event.ActionListener;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Comparator;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.Stream;

import javax.swing.JOptionPane;
import javax.swing.Timer;

public class Lambda {
	public static void main(String[] args) throws Exception {
//		String contents = new String(Files.readAllBytes(Paths.get("abc.txt")));
//		String[] list = contents.split("\\PL+") ;
//		Arrays.sort(list);
//		for (String string : list) {
//			System.out.println(string);
//		}
//		Arrays.sort(list, (first,second) -> first.length() - second.length());
//		for (String string : list) {
//			System.out.println(string);
//		}
//		Timer timer = new Timer(1000, event -> System.out.println("now the time is " + new Date()));
//		timer.start();
//		JOptionPane.showMessageDialog(null, "quit?");
//		System.exit(0);
		List<String> names = new ArrayList<>();
		names.add("aa");
		names.add("GG");
		names.add("cc");
		String[] aStrings = names.toArray(new String[3]);
		Arrays.sort(aStrings, String::compareToIgnoreCase);
		for (String string : aStrings) {
			System.out.println(string);
		}
		Timer t = new Timer(1000, System.out::println);
//		t.start();
//		JOptionPane.showMessageDialog(null, "quit?");
//		System.exit(0); 
//		Stream<Person> pStream = names.stream().map(Person :: new);
//		List<Person> persons = pStream.collect(Collectors.toList());
//		for (Person person : persons) {
//			System.out.println(person);
//		}
		repeat("hehe");
		repeat2(10, i -> System.out.println(9-i));
		
	}
	public static void repeat(String text) {
		
		for (int i = 0; i < 10; i++) {
			
			
//			timer = new Timer(1000, listener);
//			timer.start();
//			JOptionPane.showMessageDialog(null, "quit");
//			System.exit(0);
		};
		
		
		}
		
		
	public static void repeat2(int n ,IntConsumer action) {
		for (int i = 0; i < n; i++) {
			action.accept(i);
		}
		
	}
	
}

```

