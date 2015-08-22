public class Challenge223 {
    
    public static void main(String[] args) {
        for (int i = 0; i < args.length; i++) {
            System.out.println("Garland no for " + args[i] + ": " + garland(args[i]));
        } 
    }
    
    public static int garland(String s) {
        for (int i = s.length() - 1; i > 0; i--) {
            if (s.substring(0, i).equals(s.substring(s.length() - i, s.length()))) {
                return i;
            }
        }
        return 0;
    }    
}
