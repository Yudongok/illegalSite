package mvc.model;

import java.util.Random;

public class RandomAlphabets {
    // 주어진 길이의 무작위 알파벳 문자열을 생성하는 메서드
    public static String generateRandomAlphabets(int length) {
        Random random = new Random();
        StringBuilder sb = new StringBuilder(length);
        String alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";
        
        for (int i = 0; i < length; i++) {
            sb.append(alphabet.charAt(random.nextInt(alphabet.length())));
        }
        
        return sb.toString();
    }
}
