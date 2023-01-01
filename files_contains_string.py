import os
  
main_dir_path = '/home/maindir'

count_1 = 0
for root_dir, cur_dir, files in os.walk(main_dir_path):
    count_1 += len(files)
print('\nTotal file count:', count_1,'\n')

count_4 = 0
for file in os.listdir(main_dir_path):
    sub_dir = os.path.join(main_dir_path, file)
    if os.path.isdir(sub_dir):
        print('\n',sub_dir)

        count_2 = 0
        for root_dir, cur_dir, files in os.walk(sub_dir):
            count_2 += len(files)
        print('\t File count in subdirectory:',count_2)

        count_3 = 0
        for file in os.listdir(sub_dir):
            file_path = os.path.join(sub_dir, file)
            if os.path.isfile(file_path):
                with open(file_path, 'r') as file:
                    if 'Actions' in file.read():
                        count_3 += 1
                        count_4 += 1
        print('\t Automated count:',count_3)
        print('\t Not automated count:',count_2-count_3)

print('\nTotal of automated count:',count_4,)
print('Total of not automated count:',count_1-count_4,'\n')

