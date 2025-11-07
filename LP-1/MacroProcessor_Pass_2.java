import java.util.*;

class MacroProcessorPass2 {
    Map<String, Integer> MNT;
    List<String> MDT;
    List<String> intermediate;
    List<String> expandedCode = new ArrayList<>();

    MacroProcessorPass2(Map<String, Integer> MNT, List<String> MDT, List<String> intermediate) {
        this.MNT = MNT;
        this.MDT = MDT;
        this.intermediate = intermediate;
    }

    void pass2() {
        for (String line : intermediate) {
            String[] parts = line.split("\\s+");
            String name = parts[0];

            if (MNT.containsKey(name)) {
                int mdtPtr = MNT.get(name);
                String defLine = MDT.get(mdtPtr);
                String[] defParts = defLine.split("\\s+");

                List<String> actualArgs = new ArrayList<>();
                if (parts.length > 1) {
                    actualArgs = Arrays.asList(parts[1].split(","));
                }

                mdtPtr++;

                while (!MDT.get(mdtPtr).equals("MEND")) {
                    String expanded = MDT.get(mdtPtr);

                    for (int i = 0; i < actualArgs.size(); i++) {
                        String param = defParts.length > 1 ? defParts[1].split(",")[i] : "";
                        expanded = expanded.replace(param, actualArgs.get(i));
                    }

                    expandedCode.add(expanded);
                    mdtPtr++;
                }
            } else {
                expandedCode.add(line);
            }
        }
    }

    void printExpandedCode() {
        System.out.println("\nExpanded Code After Pass 2");
        System.out.println("----------------------------");
        expandedCode.forEach(System.out::println);
    }
}

public class MacroProcessor_Pass_2 {
    public static void main(String[] args) {

        String program[] = {
            "MACRO",
            "INCR A,B",
            "ADD A,B",
            "MEND",
            "START",
            "INCR X,Y",
            "END"
        };

        MacroProcessorPass1 mp1 = new MacroProcessorPass1();
        mp1.pass1(program);
        mp1.printTables();

        MacroProcessorPass2 mp2 = new MacroProcessorPass2(mp1.MNT, mp1.MDT, mp1.intermediate);
        mp2.pass2();
        mp2.printExpandedCode();
    }
}
