package com.example.bt01

//noinspection SuspiciousImport
import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.activity.enableEdgeToEdge
import androidx.compose.foundation.background
import androidx.compose.foundation.border
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.Spacer
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.height
import androidx.compose.foundation.layout.size
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.foundation.text.KeyboardOptions
import androidx.compose.material3.Text
import androidx.compose.material3.TextField
import androidx.compose.runtime.Composable
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.runtime.setValue
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.text.input.KeyboardType
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import com.example.bt01.ui.theme.BT01Theme

class MainActivity : ComponentActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        enableEdgeToEdge()
        setContent {
            BT01Theme {
                    Screen()
            }
        }
    }
}

@Composable
fun Screen() {
    var text1 by remember { mutableStateOf("") }
    var text2 by remember { mutableStateOf("") }
    var selectedOp by remember { mutableStateOf<String?>(null) }

    val result=remember (text1,text2,selectedOp){
        if (text1.isEmpty() || text2.isEmpty() || selectedOp == null) {
            ""
        } else {
            val n1 = text1.toDoubleOrNull()
            val n2 = text2.toDoubleOrNull()
            if (n1 == null || n2 == null) {
                "Lỗi"
            } else {
                val result = when (selectedOp) {
                    "+" -> n1 + n2
                    "-" -> n1 - n2
                    "*" -> n1 * n2
                    "/" -> if (n2 == 0.0) "Không chia được cho 0" else n1 / n2
                    else -> ""
                }
                result.toString().removeSuffix(".0")
            }
        }
    }
    Column(
        modifier = Modifier.fillMaxSize(),
        horizontalAlignment = Alignment.CenterHorizontally,
        verticalArrangement = Arrangement.Center,
    ) {
        Text("Thực hành 03")
        Spacer(modifier = Modifier.height(50.dp))
        TextField(
            value = text1,
            onValueChange = { Text1 -> text1 = Text1.filter { it.isDigit() || it == '.' } },
            label = { Text("") },
            shape = RoundedCornerShape(16.dp),
            singleLine = true,
            keyboardOptions = KeyboardOptions(keyboardType = KeyboardType.Number),
            modifier = Modifier.fillMaxWidth(),
        )
        Spacer(modifier = Modifier.height(50.dp))
        val operators = listOf(
            "+" to Color(0xFFE53935),
            "-" to Color(0xFFFB8C00),
            "*" to  Color(0xFF5E35B1),
            "/" to Color(0xFF212121),
        )
        Row(
            modifier = Modifier.fillMaxWidth(),
            horizontalArrangement = Arrangement.SpaceBetween,
        ) {
            operators.forEach { (op, color) -> val isSelected = (selectedOp == op)
            Box(
                modifier = Modifier
                    .size(56.dp)
                    .clip(RoundedCornerShape(12.dp))
                    .background(color)
                    .border(
                        width = if (isSelected) 3.dp else 0.dp,
                        color = if (isSelected) Color.Green else Color.Transparent,
                        shape = RoundedCornerShape(12.dp)
                    )
                    .clickable { selectedOp = op },
                contentAlignment = Alignment.Center
            ) {
                Text(
                    text = op,
                    color = Color.White,
                    fontSize = 30.sp,
                )
            }
            }
        }
        Spacer(modifier = Modifier.height(50.dp))

        TextField(
            value = text2,
            onValueChange = { Text2 -> text2 = Text2.filter { it.isDigit() || it == '.' } },
            label = { Text("") },
            shape = RoundedCornerShape(16.dp),
            singleLine = true,
            keyboardOptions = KeyboardOptions(keyboardType = KeyboardType.Number),
            modifier = Modifier.fillMaxWidth(),
        )
        Spacer(modifier = Modifier.height(30.dp))

        Text(
            text = "Kết quả: $result",
            fontSize = 18.sp,
            modifier = Modifier.fillMaxWidth()
        )

    }
}
@Preview(showBackground = true)
@Composable
fun GreetingPreview() {
    BT01Theme {
        Screen()
    }
}