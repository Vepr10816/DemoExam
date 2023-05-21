using Microsoft.VisualStudio.TestTools.UnitTesting;
using System;

namespace SF2022User_05_Lib.Tests
{
    [TestClass]
    public class CalculationsTests
    {
        /// <summary>
        /// Тест на пустой список периодов. 
        /// Ожидаемый результат: массив со всеми доступными периодами.
        /// </summary>
        [TestMethod]
        public void AvailablePeriods_UnavailableTimeSlots_ReturnsEmptyArray()
        {
            TimeSpan[] startTimes = { new TimeSpan(10, 0, 0), new TimeSpan(13, 0, 0), new TimeSpan(14, 0, 0) };
            int[] durations = { 30, 60, 30 };
            TimeSpan beginWorkingTime = new TimeSpan(9, 0, 0);
            TimeSpan endWorkingTime = new TimeSpan(17, 0, 0);
            int consultationTime = 45;

            Calculations calculations = new Calculations();
            string[] result = calculations.AvailablePeriods(startTimes, durations, beginWorkingTime, endWorkingTime, consultationTime);

            Assert.AreEqual(0, result.Length);
        }


        /// <summary>
        /// Тест на периоды, которые не перекрывают рабочее время. 
        /// Ожидаемый результат: массив со всеми доступными периодами.
        /// </summary>
        [TestMethod]
        public void AvailablePeriods_AllDayBooked_ReturnsEmptyArray()
        {
            TimeSpan[] startTimes = new TimeSpan[] { new TimeSpan(9, 0, 0) };
            int[] durations = new int[] { 480 }; // 480 minutes = 8 hours
            TimeSpan beginWorkingTime = new TimeSpan(9, 0, 0);
            TimeSpan endWorkingTime = new TimeSpan(17, 0, 0);
            int consultationTime = 30;

            Calculations calculations = new Calculations();
            string[] result = calculations.AvailablePeriods(startTimes, durations, beginWorkingTime, endWorkingTime, consultationTime);

            Assert.AreEqual(0, result.Length);
        }

        /// <summary>
        /// Тест на периоды, которые перекрывают только начало рабочего времени. 
        /// Ожидаемый результат: массив с периодами времени, начинающимися после первого занятого периода.
        /// </summary>
        [TestMethod]
        public void AvailablePeriods_NoAvailableTimeSlots_ReturnsEmptyArray()
        {
            TimeSpan[] startTimes = new TimeSpan[] {
            new TimeSpan(10, 0, 0),
            new TimeSpan(13, 0, 0)
        };
            int[] durations = new int[] { 60, 120 };
            TimeSpan beginWorkingTime = new TimeSpan(9, 0, 0);
            TimeSpan endWorkingTime = new TimeSpan(17, 0, 0);
            int consultationTime = 30;

            Calculations calculations = new Calculations();
            string[] result = calculations.AvailablePeriods(startTimes, durations, beginWorkingTime, endWorkingTime, consultationTime);

            Assert.AreEqual(0, result.Length);
        }

        /// <summary>
        /// Тест на периоды, которые перекрывают только конец рабочего времени. 
        /// Ожидаемый результат: массив с периодами времени, заканчивающимися до последнего занятого периода.
        /// </summary>
        [TestMethod]
        public void AvailablePeriods_HasAvailableTimeSlots_ReturnsExpectedResults()
        {
            TimeSpan[] startTimes = new TimeSpan[] {
            new TimeSpan(10, 0, 0),
            new TimeSpan(13, 0, 0)
            };
            int[] durations = new int[] { 45, 120 };
            TimeSpan beginWorkingTime = new TimeSpan(9, 0, 0);
            TimeSpan endWorkingTime = new TimeSpan(17, 0, 0);
            int consultationTime = 30;

            Calculations calculations = new Calculations();
            string[] result = calculations.AvailablePeriods(startTimes, durations, beginWorkingTime, endWorkingTime, consultationTime);

            Assert.AreEqual("09:00-10:00, 10:45-13:00, 14:00-17:00", string.Join(", ", result));
        }

        /// <summary>
        /// Тест на периоды, которые перекрывают весь рабочий день.
        /// Ожидаемый результат: пустой массив, т.к. доступных периодов нет.
        /// </summary>
        [TestMethod]
        public void AvailablePeriods_NotEnoughTimeSlots_ReturnsEmptyArray()
        {
            TimeSpan[] startTimes = { new TimeSpan(10, 0, 0), new TimeSpan(13, 0, 0) };
            int[] durations = { 60, 120 };
            TimeSpan beginWorkingTime = new TimeSpan(9, 0, 0);
            TimeSpan endWorkingTime = new TimeSpan(17, 0, 0);
            int consultationTime = 30;

            Calculations calculations = new Calculations();
            string[] result = calculations.AvailablePeriods(startTimes, durations, beginWorkingTime, endWorkingTime, consultationTime);

            Assert.AreEqual(0, result.Length);
        }

        /// <summary>
        /// Тест на периоды, которые перекрывают множество разных моментов внутри рабочего дня. 
        /// Ожидаемый результат: массив со всеми доступными периодами.
        /// </summary>
        [TestMethod]
        public void AvailablePeriods_DurationsDoNotMatchStartTimes_ReturnsAllAvailablePeriods()
        {
            TimeSpan[] startTimes = { new TimeSpan(10, 0, 0), new TimeSpan(13, 0, 0), new TimeSpan(14, 0, 0) };
            int[] durations = { 60, 30 };
            TimeSpan beginWorkingTime = new TimeSpan(9, 0, 0);
            TimeSpan endWorkingTime = new TimeSpan(17, 0, 0);
            int consultationTime = 30;

            Calculations calculations = new Calculations();
            string[] result = calculations.AvailablePeriods(startTimes, durations, beginWorkingTime, endWorkingTime, consultationTime);

            Assert.AreEqual("09:00-10:00, 10:30-13:00, 13:30-14:00, 14:30-17:00", string.Join(", ", result));
        }

        /// <summary>
        /// Тест на периоды, которые перекрывают друг друга. 
        /// Ожидаемый результат: массив со всеми доступными периодами, отличными от занятых периодов.
        /// </summary>
        [TestMethod]
        public void AvailablePeriods_ConsultationTimeGreaterThanDuration_ReturnsAllAvailablePeriods()
        {
            TimeSpan[] startTimes = { new TimeSpan(10, 0, 0), new TimeSpan(13, 0, 0) };
            int[] durations = { 45, 120 };
            TimeSpan beginWorkingTime = new TimeSpan(9, 0, 0);
            TimeSpan endWorkingTime = new TimeSpan(17, 0, 0);
            int consultationTime = 60;

            Calculations calculations = new Calculations();
            string[] result = calculations.AvailablePeriods(startTimes, durations, beginWorkingTime, endWorkingTime, consultationTime);

            Assert.AreEqual("09:00-10:00, 11:15-13:00, 14:00-17:00", string.Join(", ", result));
        }

        /// <summary>
        /// Тест на слишком короткий период консультации. 
        /// Ожидаемый результат: пустой массив, т.к. доступных периодов нет.
        /// </summary>
        [TestMethod]
        public void AvailablePeriods_ConsultationTimeEqualToDuration_ReturnsAllAvailablePeriods()
        {
            TimeSpan[] startTimes = { new TimeSpan(10, 0, 0), new TimeSpan(13, 0, 0) };
            int[] durations = { 45, 120 };
            TimeSpan beginWorkingTime = new TimeSpan(9, 0, 0);
            TimeSpan endWorkingTime = new TimeSpan(17, 0, 0);
            int consultationTime = 45;

            Calculations calculations = new Calculations();
            string[] result = calculations.AvailablePeriods(startTimes, durations, beginWorkingTime, endWorkingTime, consultationTime);

            Assert.AreEqual("09:00-10:00, 11:00-13:00, 14:00-17:00", string.Join(", ", result));
        }
    }
}
    

