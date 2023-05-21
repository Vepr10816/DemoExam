using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SF2022User_05_Lib
{
    public class Calculations
    {
        
        public string[] AvailablePeriods(TimeSpan[] startTimes, int[] durations, TimeSpan beginWorkingTime, TimeSpan endWorkingTime, int consultationTime)
        {
            List<TimeSpan> busyTimeSlots = new List<TimeSpan>();
            for (int i = 0; i < startTimes.Length; i++)
            {
                TimeSpan busyStartTime = startTimes[i];
                TimeSpan busyEndTime = startTimes[i].Add(TimeSpan.FromMinutes(durations[i]));
                if (busyEndTime > endWorkingTime)
                {
                    busyEndTime = endWorkingTime;
                }
                if (busyStartTime < beginWorkingTime)
                {
                    busyStartTime = beginWorkingTime;
                }
                busyTimeSlots.Add(busyStartTime);
                busyTimeSlots.Add(busyEndTime);
            }
            busyTimeSlots.Sort();

            List<string> freeTimeSlots = new List<string>();
            TimeSpan lastFreeEnd = beginWorkingTime;
            foreach (TimeSpan busyTime in busyTimeSlots)
            {
                TimeSpan freeTimeSlotStart = lastFreeEnd;
                TimeSpan freeTimeSlotEnd = busyTime;
                if ((freeTimeSlotEnd - freeTimeSlotStart).Minutes >= consultationTime)
                {
                    freeTimeSlots.Add($"{freeTimeSlotStart:hh\\:mm}-{freeTimeSlotEnd:hh\\:mm}");
                }
                lastFreeEnd = busyTime;
            }
            TimeSpan lastFreeSlotEnd = endWorkingTime;
            if ((lastFreeSlotEnd - lastFreeEnd).Minutes >= consultationTime)
            {
                freeTimeSlots.Add($"{lastFreeEnd:hh\\:mm}-{lastFreeSlotEnd:hh\\:mm}");
            }

            return freeTimeSlots.ToArray();
        }
    }
}
