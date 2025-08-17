package com.ayman.imcapp; // adapte si besoin

import androidx.appcompat.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ImageView;
import android.widget.TextView;
import android.widget.Toast;

import java.text.DecimalFormat;
import java.text.DecimalFormatSymbols;
import java.util.Locale;

public class MainActivity extends AppCompatActivity {


    private EditText etPoids, etTaille;
    private TextView tvImc, tvCategorie;
    private ImageView ivCategorie;

    private final DecimalFormat df =
            new DecimalFormat("#0.00", DecimalFormatSymbols.getInstance(Locale.FRANCE));

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        etPoids = findViewById(R.id.etPoids);
        etTaille = findViewById(R.id.etTaille);
        tvImc = findViewById(R.id.tvImc);
        tvCategorie = findViewById(R.id.tvCategorie);
        ivCategorie = findViewById(R.id.ivCategorie);
        Button btnCalculer = findViewById(R.id.btnCalculer);

        btnCalculer.setOnClickListener(v -> calculer());
    }

    private void calculer() {
        String sPoids = etPoids.getText().toString().trim();
        String sTaille = etTaille.getText().toString().trim();

        if (sPoids.isEmpty() || sTaille.isEmpty()) {
            Toast.makeText(this, "Veuillez saisir le poids et la taille.", Toast.LENGTH_SHORT).show();
            return;
        }

        try {
            double poids = Double.parseDouble(sPoids.replace(',', '.'));
            double t = Double.parseDouble(sTaille.replace(',', '.'));

            // si l'utilisateur entre des cm (>3), convertir en mètres
            double tailleM = (t > 3) ? (t / 100.0) : t;
            if (poids <= 0 || tailleM <= 0) {
                Toast.makeText(this, "Valeurs invalides.", Toast.LENGTH_SHORT).show();
                return;
            }

            double imc = poids / (tailleM * tailleM);
            tvImc.setText("Votre IMC est : " + df.format(imc));

            String label;
            int imgRes;
            if (imc < 18.5) {
                label = "Maigreur";
                imgRes = R.drawable.maigre;
            } else if (imc < 25) {
                label = "Normal";
                imgRes = R.drawable.normal;
            } else if (imc < 30) {
                label = "Surpoids";
                imgRes = R.drawable.surpoids;
            } else if (imc < 40) {
                label = "Obésité modérée";
                imgRes = R.drawable.surpoids;
            } else {
                label = "Obésité sévère";
                imgRes = R.drawable.t_obese;
            }

            tvCategorie.setText(label);
            ivCategorie.setImageResource(imgRes);
            ivCategorie.setVisibility(View.VISIBLE);

        } catch (NumberFormatException e) {
            Toast.makeText(this, "Format numérique invalide.", Toast.LENGTH_SHORT).show();
        }
    }
}
