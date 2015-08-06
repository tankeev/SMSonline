Imports System.Diagnostics

Public Class clsNum2Word

    Public Function Num2WordConverter(ByVal Number As String) As Object

        Dim Words As String = Nothing
        Dim Length As Integer = 0
        Dim Whole As Decimal = Nothing
        Dim Fraction As Decimal = Nothing

        Whole = Math.Floor(Convert.ToDecimal(Number))
        Number = (Convert.ToDecimal(Number) - Whole).ToString()
        Fraction = Convert.ToDecimal(Number.ToString() & "000")
        Length = Whole.ToString().Length

        'coz if the fraction part is just 0 it will generate error in substring
        If Fraction.ToString().Length >= 4 Then
            Fraction = Convert.ToInt32(Fraction.ToString().Substring(2, 2))
        End If

        'For 10 to 99 Crores
        If Length = 9 Then
            Words = Convert.ToString(MakeWord(Convert.ToInt32(Whole.ToString().Substring(0, 2)))) & " Crore(s)"
            If Convert.ToInt32(Whole.ToString().Substring(2, 2)) <> 0 Then
                Words += " " & Convert.ToString(MakeWord(Convert.ToInt32(Whole.ToString().Substring(2, 2)))) & " Lac(s)"
            End If
            If Convert.ToInt32(Whole.ToString().Substring(4, 2)) <> 0 Then
                Words += " " & Convert.ToString(MakeWord(Convert.ToInt32(Whole.ToString().Substring(4, 2)))) & " Thousand"
            End If
            If Convert.ToInt32(Whole.ToString().Substring(6, 1)) <> 0 Then
                Words += " " & Convert.ToString(MakeWord(Convert.ToInt32(Whole.ToString().Substring(6, 1)))) & " Hundred"
            End If
            If Convert.ToInt32(Whole.ToString().Substring(7, 2)) <> 0 Then
                Words += " " & Convert.ToString(MakeWord(Convert.ToInt32(Whole.ToString().Substring(7, 2))))
            End If
            'Words += " Rupee(s) And " & Convert.ToString(MakeWord(Convert.ToInt32(Fraction))) & " Paise Only."
            Words += "  " & Convert.ToString(MakeWord(Convert.ToInt32(Fraction))) & " "
        ElseIf Length = 8 Then
            Words = Convert.ToString(MakeWord(Convert.ToInt32(Whole.ToString().Substring(0, 1)))) & " Crore(s)"
            If Convert.ToInt32(Whole.ToString().Substring(1, 2)) <> 0 Then
                Words += " " & Convert.ToString(MakeWord(Convert.ToInt32(Whole.ToString().Substring(1, 2)))) & " Lac(s)"
            End If
            If Convert.ToInt32(Whole.ToString().Substring(3, 2)) <> 0 Then
                Words += " " & Convert.ToString(MakeWord(Convert.ToInt32(Whole.ToString().Substring(3, 2)))) & " Thousand"
            End If
            If Convert.ToInt32(Whole.ToString().Substring(5, 1)) <> 0 Then
                Words += " " & Convert.ToString(MakeWord(Convert.ToInt32(Whole.ToString().Substring(5, 1)))) & " Hundred"
            End If
            If Convert.ToInt32(Whole.ToString().Substring(6, 2)) <> 0 Then
                Words += " " & Convert.ToString(MakeWord(Convert.ToInt32(Whole.ToString().Substring(6, 2))))
            End If
            'Words += " Rupee(s) And " & Convert.ToString(MakeWord(Convert.ToInt32(Fraction))) & " Paise Only."
            Words += " " & Convert.ToString(MakeWord(Convert.ToInt32(Fraction))) & " "
        ElseIf Length = 7 Then
            Words = Convert.ToString(MakeWord(Convert.ToInt32(Whole.ToString().Substring(0, 2)))) & " Lac(s)"
            If Convert.ToInt32(Whole.ToString().Substring(2, 2)) <> 0 Then
                Words += " " & Convert.ToString(MakeWord(Convert.ToInt32(Whole.ToString().Substring(2, 2)))) & " Thousand"
            End If
            If Convert.ToInt32(Whole.ToString().Substring(4, 1)) <> 0 Then
                Words += " " & Convert.ToString(MakeWord(Convert.ToInt32(Whole.ToString().Substring(4, 1)))) & " Hundred"
            End If
            If Convert.ToInt32(Whole.ToString().Substring(5, 2)) <> 0 Then
                Words += " " & Convert.ToString(MakeWord(Convert.ToInt32(Whole.ToString().Substring(5, 2))))
            End If
            ' Words += " Rupee(s) And " & Convert.ToString(MakeWord(Convert.ToInt32(Fraction))) & " Paise Only."
            Words += "  " & Convert.ToString(MakeWord(Convert.ToInt32(Fraction))) & " "
        ElseIf Length = 6 Then
            Words = Convert.ToString(MakeWord(Convert.ToInt32(Whole.ToString().Substring(0, 1)))) & " lac(s)"
            If Convert.ToInt32(Whole.ToString().Substring(1, 2)) <> 0 Then
                Words += " " & Convert.ToString(MakeWord(Convert.ToInt32(Whole.ToString().Substring(1, 2)))) & " Thousand"
            End If
            If Convert.ToInt32(Whole.ToString().Substring(3, 1)) <> 0 Then
                Words += " " & Convert.ToString(MakeWord(Convert.ToInt32(Whole.ToString().Substring(3, 1)))) & " Hundred"
            End If
            If Convert.ToInt32(Whole.ToString().Substring(4, 2)) <> 0 Then
                Words += " " & Convert.ToString(MakeWord(Convert.ToInt32(Whole.ToString().Substring(4, 2))))
            End If
            ' Words += " Rupee(s) And " & Convert.ToString(MakeWord(Convert.ToInt32(Fraction))) & " Paise Only."
            Words += "  " & Convert.ToString(MakeWord(Convert.ToInt32(Fraction))) & " "
        ElseIf Length = 5 Then
            Words = Convert.ToString(MakeWord(Convert.ToInt32(Whole.ToString().Substring(0, 2)))) & " Thousand"
            If Convert.ToInt32(Whole.ToString().Substring(2, 1)) <> 0 Then
                Words += " " & Convert.ToString(MakeWord(Convert.ToInt32(Whole.ToString().Substring(2, 1)))) & " Hundred"
            End If
            If Convert.ToInt32(Whole.ToString().Substring(3, 2)) <> 0 Then
                Words += " " & Convert.ToString(MakeWord(Convert.ToInt32(Whole.ToString().Substring(3, 2))))
            End If
            'Words += " Rupee(s) And " & Convert.ToString(MakeWord(Convert.ToInt32(Fraction))) & " Paise Only."
            Words += " " & Convert.ToString(MakeWord(Convert.ToInt32(Fraction))) & " "
        ElseIf Length = 4 Then
            Words = Convert.ToString(MakeWord(Convert.ToInt32(Whole.ToString().Substring(0, 1)))) & " Thousand"
            If Convert.ToInt32(Whole.ToString().Substring(1, 1)) <> 0 Then
                Words += " " & Convert.ToString(MakeWord(Convert.ToInt32(Whole.ToString().Substring(1, 1)))) & " Hundred"
            End If
            If Convert.ToInt32(Whole.ToString().Substring(2, 2)) <> 0 Then
                Words += " " & Convert.ToString(MakeWord(Convert.ToInt32(Whole.ToString().Substring(2, 2))))
            End If
            ' Words += " Rupee(s) And " & Convert.ToString(MakeWord(Convert.ToInt32(Fraction))) & " Paise Only."
            Words += " " & Convert.ToString(MakeWord(Convert.ToInt32(Fraction))) & " "
        ElseIf Length = 3 Then
            Words = Convert.ToString(MakeWord(Convert.ToInt32(Whole.ToString().Substring(0, 1)))) & " Hundred"
            If Convert.ToInt32(Whole.ToString().Substring(1, 2)) <> 0 Then
                Words += " " & Convert.ToString(MakeWord(Convert.ToInt32(Whole.ToString().Substring(1, 2))))
            End If
            'Words += " Rupee(s) And " & Convert.ToString(MakeWord(Convert.ToInt32(Fraction))) & " Paise Only."
            Words += " " & Convert.ToString(MakeWord(Convert.ToInt32(Fraction))) & ""
        ElseIf Length <= 2 Then
            'Words = Convert.ToString(MakeWord(Convert.ToInt32(Whole))) & " Rupee(s) And " & Convert.ToString(MakeWord(Convert.ToInt32(Fraction))) & " Paise Only."
            Words = Convert.ToString(MakeWord(Convert.ToInt32(Whole))) & "  " & Convert.ToString(MakeWord(Convert.ToInt32(Fraction))) & " "
        Else
            Words = "Range Exceeded."
        End If
        Return Words
    End Function
    Private Function MakeWord(ByVal Number As Integer) As Object
        Select Case Number
            Case 0
                Return ""
            Case 1
                Return "one"
            Case 2
                Return "two"
            Case 3
                Return "three"
            Case 4
                Return "four"
            Case 5
                Return "five"
            Case 6
                Return "six"
            Case 7
                Return "seven"
            Case 8
                Return "eight"
            Case 9
                Return "nine"
            Case 10
                Return "ten"
            Case 11
                Return "eleven"
            Case 12
                Return "twelve"
            Case 13
                Return "thirteen"
            Case 14
                Return "fourteen"
            Case 15
                Return "fifteen"
            Case 16
                Return "sixteen"
            Case 17
                Return "seventeen"
            Case 18
                Return "eighteen"
            Case 19
                Return "nineteen"
            Case 20
                Return "twenty"
            Case 21
                Return "twenty-one"
            Case 22
                Return "twenty-two"
            Case 23
                Return "twenty-three"
            Case 24
                Return "twenty-four"
            Case 25
                Return "twenty-five"
            Case 26
                Return "twenty-six"
            Case 27
                Return "twenty-seven"
            Case 28
                Return "twenty-eight"
            Case 29
                Return "twenty-nine"
            Case 30
                Return "thirty"
            Case 31
                Return "thirty-one"
            Case 32
                Return "thirty-two"
            Case 33
                Return "thirty-three"
            Case 34
                Return "thirty-four"
            Case 35
                Return "thirty-five"
            Case 36
                Return "thirty-six"
            Case 37
                Return "thirty-seven"
            Case 38
                Return "thirty-eight"
            Case 39
                Return "thirty-nine"
            Case 40
                Return "forty"
            Case 41
                Return "forty-one"
            Case 42
                Return "forty-two"
            Case 43
                Return "forty-three"
            Case 44
                Return "forty-four"
            Case 45
                Return "forty-five"
            Case 46
                Return "forty-six"
            Case 47
                Return "forty-seven"
            Case 48
                Return "forty-eight"
            Case 49
                Return "forty-nine"
            Case 50
                Return "fifty"
            Case 51
                Return "fifty-one"
            Case 52
                Return "fifty-two"
            Case 53
                Return "fifty-three"
            Case 54
                Return "fifty-four"
            Case 55
                Return "fifty-five"
            Case 56
                Return "fifty-six"
            Case 57
                Return "fifty-seven"
            Case 58
                Return "fifty-eight"
            Case 59
                Return "fifty-nine"
            Case 60
                Return "sixty"
            Case 61
                Return "sixty-one"
            Case 62
                Return "sixty-two"
            Case 63
                Return "sixty-three"
            Case 64
                Return "sixty-four"
            Case 65
                Return "sixty-five"
            Case 66
                Return "sixty-six"
            Case 67
                Return "sixty-seven"
            Case 68
                Return "sixty-eight"
            Case 69
                Return "sixty-nine"
            Case 70
                Return "seventy"
            Case 71
                Return "seventy-one"
            Case 72
                Return "seventy-two"
            Case 73
                Return "seventy-three"
            Case 74
                Return "seventy-four"
            Case 75
                Return "seventy-five"
            Case 76
                Return "seventy-six"
            Case 77
                Return "seventy-seven"
            Case 78
                Return "seventy-eight"
            Case 79
                Return "seventy-nine"
            Case 80
                Return "eighty"
            Case 81
                Return "eighty-one"
            Case 82
                Return "eighty-two"
            Case 83
                Return "eighty-three"
            Case 84
                Return "eighty-four"
            Case 85
                Return "eighty-five"
            Case 86
                Return "eighty-six"
            Case 87
                Return "eighty-seven"
            Case 88
                Return "eighty-eight"
            Case 89
                Return "eighty-nine"
            Case 90
                Return "ninety"
            Case 91
                Return "ninety-one"
            Case 92
                Return "ninety-two"
            Case 93
                Return "ninety-three"
            Case 94
                Return "ninety-four"
            Case 95
                Return "ninety-five"
            Case 96
                Return "ninety-six"
            Case 97
                Return "ninety-seven"
            Case 98
                Return "ninety-eight"
            Case 99
                Return "ninety-nine"
            Case 100
                Return "one hundred"
            Case Else
                Return "Error"
        End Select
    End Function

    'Private Function MakeWord(ByVal Number As Integer) As Object
    '    Select Case Number
    '        Case 0
    '            Return ""
    '        Case 1
    '            Return "One"
    '        Case 2
    '            Return "Two"
    '        Case 3
    '            Return "Three"
    '        Case 4
    '            Return "Four"
    '        Case 5
    '            Return "Five"
    '        Case 6
    '            Return "Six"
    '        Case 7
    '            Return "Seven"
    '        Case 8
    '            Return "Eight"
    '        Case 9
    '            Return "Nine"
    '        Case 10
    '            Return "Ten"
    '        Case 11
    '            Return "Eleven"
    '        Case 12
    '            Return "Tweleve"
    '        Case 13
    '            Return "Thirteen"
    '        Case 14
    '            Return "Fourteen"
    '        Case 15
    '            Return "Fifteen"
    '        Case 16
    '            Return "Sixteen"
    '        Case 17
    '            Return "Seventeen"
    '        Case 18
    '            Return "Eighteen"
    '        Case 19
    '            Return "Nineteen"
    '        Case 20
    '            Return "Twenty"
    '        Case 21
    '            Return "Twenty One"
    '        Case 22
    '            Return "Twenty Two"
    '        Case 23
    '            Return "Twenty Three"
    '        Case 24
    '            Return "Twenty Four"
    '        Case 25
    '            Return "Twenty Five"
    '        Case 26
    '            Return "Twenty Six"
    '        Case 27
    '            Return "Twenty Seven"
    '        Case 28
    '            Return "Twenty Eight"
    '        Case 29
    '            Return "Twenty Nine"
    '        Case 30
    '            Return "Thirty"
    '        Case 31
    '            Return "Thirty One"
    '        Case 32
    '            Return "Thirty Two"
    '        Case 33
    '            Return "Thirty Three"
    '        Case 34
    '            Return "Thirty Four"
    '        Case 35
    '            Return "Thirty Five"
    '        Case 36
    '            Return "Thirty Six"
    '        Case 37
    '            Return "Thirty Seven"
    '        Case 38
    '            Return "Thirty Eight"
    '        Case 39
    '            Return "Thirty Nine"
    '        Case 40
    '            Return "Forty"
    '        Case 41
    '            Return "Forty One"
    '        Case 42
    '            Return "Forty Two"
    '        Case 43
    '            Return "Forty Three"
    '        Case 44
    '            Return "Forty Four"
    '        Case 45
    '            Return "Forty Five"
    '        Case 46
    '            Return "Forty Six"
    '        Case 47
    '            Return "Forty Seven"
    '        Case 48
    '            Return "Forty Eight"
    '        Case 49
    '            Return "Forty Nine"
    '        Case 50
    '            Return "Fifty"
    '        Case 51
    '            Return "Fifty One"
    '        Case 52
    '            Return "Fifty Two"
    '        Case 53
    '            Return "Fifty Three"
    '        Case 54
    '            Return "Fifty Four"
    '        Case 55
    '            Return "Fifty Five"
    '        Case 56
    '            Return "Fifty Six"
    '        Case 57
    '            Return "Fifty Seven"
    '        Case 58
    '            Return "Fifty Eight"
    '        Case 59
    '            Return "Fifty Nine"
    '        Case 60
    '            Return "Sixty"
    '        Case 61
    '            Return "Sixty One"
    '        Case 62
    '            Return "Sixty Two"
    '        Case 63
    '            Return "Sixty Three"
    '        Case 64
    '            Return "Sixty Four"
    '        Case 65
    '            Return "Sixty Five"
    '        Case 66
    '            Return "Sixty Six"
    '        Case 67
    '            Return "Sixty Seven"
    '        Case 68
    '            Return "Sixty Eight"
    '        Case 69
    '            Return "Sixty Nine"
    '        Case 70
    '            Return "Seventy"
    '        Case 71
    '            Return "Seventy One"
    '        Case 72
    '            Return "Seventy Two"
    '        Case 73
    '            Return "Seventy Three"
    '        Case 74
    '            Return "Seventy Four"
    '        Case 75
    '            Return "Seventy Five"
    '        Case 76
    '            Return "Seventy Six"
    '        Case 77
    '            Return "Seventy Seven"
    '        Case 78
    '            Return "Seventy Eight"
    '        Case 79
    '            Return "Seventy Nine"
    '        Case 80
    '            Return "Eighty"
    '        Case 81
    '            Return "Eighty One"
    '        Case 82
    '            Return "Eighty Two"
    '        Case 83
    '            Return "Eighty Three"
    '        Case 84
    '            Return "Eighty Four"
    '        Case 85
    '            Return "Eighty Five"
    '        Case 86
    '            Return "Eighty Six"
    '        Case 87
    '            Return "Eighty Seven"
    '        Case 88
    '            Return "Eighty Eight"
    '        Case 89
    '            Return "Eighty Nine"
    '        Case 90
    '            Return "Ninety"
    '        Case 91
    '            Return "Ninety One"
    '        Case 92
    '            Return "Ninety Two"
    '        Case 93
    '            Return "Ninety Three"
    '        Case 94
    '            Return "Ninety Four"
    '        Case 95
    '            Return "Ninety Five"
    '        Case 96
    '            Return "Ninety Six"
    '        Case 97
    '            Return "Ninety Seven"
    '        Case 98
    '            Return "Ninety Eight"
    '        Case 99
    '            Return "Ninety Nine"
    '        Case Else
    '            Return "Error"
    '    End Select
    'End Function
End Class


