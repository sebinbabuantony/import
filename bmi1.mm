package com.example.bmicalculator;

import android.os.Bundle;
import android.view.View;
import android.widget.*;

import androidx.appcompat.app.AppCompatActivity;

public class MainActivity extends AppCompatActivity {

    EditText weightInput, heightInput;
    Button calculateBtn;
    TextView resultText;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        weightInput = findViewById(R.id.weightInput);
        heightInput = findViewById(R.id.heightInput);
        calculateBtn = findViewById(R.id.calculateBtn);
        resultText = findViewById(R.id.resultText);

        calculateBtn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                String weightStr = weightInput.getText().toString();
                String heightStr = heightInput.getText().toString();

                if (!weightStr.isEmpty() && !heightStr.isEmpty()) {
                    float weight = Float.parseFloat(weightStr);
                    float height = Float.parseFloat(heightStr) / 100; // convert to meters

                    float bmi = weight / (height * height);
                    String category;

                    if (bmi < 18.5) {
                        category = "Underweight";
                    } else if (bmi < 25) {
                        category = "Normal";
                    } else if (bmi < 30) {
                        category = "Overweight";
                    } else {
                        category = "Obese";
                    }

                    resultText.setText("Your BMI is: " + String.format("%.2f", bmi) + "\nCategory: " + category);
                } else {
                    resultText.setText("Please enter both weight and height.");
                }
            }
        });
    }
}
<?xml version="1.0" encoding="utf-8"?>
<LinearLayout xmlns:android="http://schemas.android.com/apk/res/android"
    android:layout_width="match_parent"
    android:layout_height="match_parent"
    android:orientation="vertical"
    android:padding="24dp">

    <EditText
        android:id="@+id/weightInput"
        android:layout_width="match_parent"
        android:layout_height="wrap_content"
        android:hint="Enter weight (kg)"
        android:inputType="numberDecimal" />

    <EditText
        android:id="@+id/heightInput"
        android:layout_width="match_parent"
        android:layout_height="wrap_content"
        android:hint="Enter height (cm)"
        android:inputType="numberDecimal"
        android:layout_marginTop="16dp"/>

    <Button
        android:id="@+id/calculateBtn"
        android:layout_width="wrap_content"
        android:layout_height="wrap_content"
        android:text="Calculate BMI"
        android:layout_marginTop="24dp"/>

    <TextView
        android:id="@+id/resultText"
        android:layout_width="wrap_content"
        android:layout_height="wrap_content"
        android:text=""
        android:textSize="18sp"
        android:layout_marginTop="24dp"/>

</LinearLayout>

